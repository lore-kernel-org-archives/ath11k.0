Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81EFEC43334
	for <ath11k@archiver.kernel.org>; Mon,  6 Jun 2022 14:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KXhe9nT3krFr2bdC0X5hVqB+J6le/L+SnnR1lmb0KPQ=; b=EiCFGofe2ISK1y
	v7F7diWnVPesk8dcENstu6okEz0hgS84YGs/yNROwh+J3t5qtA58NitrAa10TnUDbixQhHjD93j9l
	BJX5QGcQir1a3PiwGs/noUMftD39K7xqUu3S+zjWlEaeu1UOOt6T0OsH09sWi2DDjffUOEPROc3vC
	ppoMKfeSf1GXX0lln6Qh7h/cblTTLg5/L4waSdS0bKvyIo4hAwes3yE9XqvJFuXLt9dK6UlM/Y41s
	BjRDOsdrP4d46PjgOSb/Q1wHKn/ZRuOmLJYb0IveSGl3aNz4ai9FWx7/RXXxcyicON9eaJZldalZ4
	b34C5qgrXVusxBd/gtEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDQG-001S9G-Uq; Mon, 06 Jun 2022 14:09:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyDQE-001S8g-Js
	for ath11k@lists.infradead.org; Mon, 06 Jun 2022 14:09:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D24B16135B;
	Mon,  6 Jun 2022 14:09:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53A01C385A9;
	Mon,  6 Jun 2022 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654524573;
	bh=xOo5DWzZui20CIsgcscdrFQMIfcx26XVOfbAkUjR34E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PQ/yd1lQZR0tpO0Xk/XlcK8k7gHS7aNH5dEm/oZbAt62gSM4j8L64a4c2rJtL0hPn
	 aKb/SekUi6YWQ8h7CJYHr2wCEbw6BUmIA9nrtyVg7miGquM0+T4Fpjy0KTeR4fZQpT
	 K2O9qA4DZFhYqpGdoPgVmAL0EhdxD74VKk8vhanMFi3dVSWQCK5qBM6SaCrTSZep3Y
	 y1khFUFfQM8MewFGRq+OwSk1ixhpiYjkFfs/cywYC/EO6YzOk7yfnCaWqk0VdBjdRu
	 vT1D3yHS4ZRBcJWQBS9QCc4sncDUQ23+qoqjeu+b07q18TlCm8JITxauUxPjQlILTp
	 H2jg8V667WOEg==
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Avoid REO CMD failed prints during firmware
 recovery
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220602122929.18896-1-quic_mpubbise@quicinc.com>
References: <20220602122929.18896-1-quic_mpubbise@quicinc.com>
To: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165452456971.15301.3255857087699251778.kvalo@kernel.org>
Date: Mon,  6 Jun 2022 14:09:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220606_070934_734970_5780FAE4 
X-CRM114-Status: GOOD (  11.39  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Manikanta Pubbisetty <quic_mpubbise@quicinc.com> wrote:

> Currently when firmware recovery is in progress, we do not queue REO
> commands to the firmware, instead -ESHUTDOWN will be returned to the
> caller leading to a failure print on the console. The REO command in
> the problem scenario is sent for all tids of a peer in which case we
> will have 16 failure prints on the console for a single peer. For an
> AP usecase, this count would be even higher in a worst case scenario.
> Since these commands are bound to fail during firmware recovery, it
> is better to avoid printing these failures and thereby avoid message
> flooding on the console.
> 
> Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.1.0.1-00887-QCAMSLSWPLZ-1
> 
> Fixes: 8ee8d38ca472 ("ath11k: Fix crash during firmware recovery on reo cmd ring access")
> Signed-off-by: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0ab52b2bd7be ath11k: Avoid REO CMD failed prints during firmware recovery

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220602122929.18896-1-quic_mpubbise@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
