Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D84C5DF94
	for <ath11k@archiver.kernel.org>; Mon, 24 Aug 2026 10:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvsWS6j+dl/P6nzXApBy9aetSb9gdiDTKDgGSSlbxB4=; b=ELw+ZjSLIZs7S1pFoIQxtUw2Qo
	+VdgqAb1qKG8j7dtGXil+khgx9tKkFS+SUFs5B8M/hsy217Wwbsf3AloBSqzoM+Z8Q5Wh3k47PNEe
	hhtx8+pQvGn4QY/T0FTVLt64KBwbQnR9cD81wCEU/6tbtx4p9XJTUiNdwI27gaZ6ea0tlfpOGdBPh
	cz7KgWG8nfqduMKbj/ASOGPMlMDOmGhtDrHWxMCefy+EhUSjeaq/CYrS/BlVKILiwrlJKZYaty+8f
	+6+tKESd1ztyNhlEkc8Z/AA/Bquw24wbicqFSUQ35NSZ4bapjBnruqd7n7DaDwwePkRSp7PYPZSwv
	CK93rakg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySC8-0000000GQSY-3wJx;
	Mon, 24 Aug 2026 10:46:24 +0000
Received: from mail.toke.dk ([2a0c:4d80:42:2001::664])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wySC6-0000000GQRW-14PH
	for ath11k@lists.infradead.org;
	Mon, 24 Aug 2026 10:46:24 +0000
Authentication-Results: mail.toke.dk; dkim=none
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
To: Julius Bairaktaris <julius@bairaktaris.de>, Jeff Johnson
 <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v1 2/4] wifi: ath11k: enable airtime queue limits
In-Reply-To: <20260823195703.49198-3-julius@bairaktaris.de>
References: <20260823195703.49198-1-julius@bairaktaris.de>
 <20260823195703.49198-3-julius@bairaktaris.de>
Date: Mon, 24 Aug 2026 12:46:12 +0200
X-Clacks-Overhead: GNU Terry Pratchett
Message-ID: <87v78zeqyz.fsf@toke.dk>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_034622_455280_790CC45F 
X-CRM114-Status: GOOD (  17.68  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Julius Bairaktaris <julius@bairaktaris.de> writes:

> ath11k does not advertise NL80211_EXT_FEATURE_AQL, and every user of AQL in
> mac80211 is gated on that bit: the airtime charge in
> ieee80211_tx_dequeue(), ieee80211_txq_airtime_check(),
> ieee80211_sta_update_pending_airtime(), and the per-station aql file in
> debugfs, which is not even created. AQL is not untuned on this driver, it
> is absent.
>
> That matters here more than it would elsewhere, because AQL is the only
> brake. ath11k uses ieee80211_handle_wake_tx_queue(), whose
> wake_tx_push_queue() drains a selected txq whole into the driver, and the
> check at the top of ieee80211_tx_dequeue() is what stops that drain.
> Without the feature bit nothing does, so mac80211 holds no backlog and
> every queued byte of a saturated download sits in the hardware TX rings,
> where there is no AQM and no flow separation.
>
> Measured on an IPQ8074 AP against one HE 160 MHz station at MCS 11, taken
> from that station's own aql file while it received 280 Mbit/s: its BE queue
> depth reaches 6356 us of the 12000 us default limit, and 2972 us when the
> limit is lowered to 500/1000 us. Without this patch the file does not exist
> and the limits are never consulted.

Did you test if this actually has any impact on latency under load for
the station in question?

> The rate the estimator needs is already there: ath11k keeps a per-station
> rate_info in arsta->last_txrate and passes it to ieee80211_tx_status_ext(),
> which stores it as tx_stats.last_rate_info, and that is what
> ieee80211_calc_expected_tx_airtime() reads. Where no rate is known yet the
> estimator returns zero, no airtime is charged, and AQL stays inert, so this
> cannot behave worse than the current code.
>
> The estimate is only as fresh as arsta->last_txrate, which is updated from
> the HTT PPDU stats when a descriptor is evicted from ar->ppdu_stats_info,
> so the rate behind it can lag a rate change by up to
> HTT_PPDU_DESC_MAX_DEPTH PPDUs.
>
> ieee80211_sta_update_pending_airtime() returns the airtime but does not
> reschedule the txq, and ath11k has no completion-side push, so a queue held
> back by AQL is re-poked only by the next enqueue or queue wake.

This sounds like it could leave to stuck queues? :/

-Toke

