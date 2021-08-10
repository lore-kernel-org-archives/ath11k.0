Return-Path: <SRS0=0MIV=NB=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C78C7C4338F
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 10:15:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE1060FD8
	for <ath11k@archiver.kernel.org>; Tue, 10 Aug 2021 10:15:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1CE1060FD8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nbd.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=f8OVxG7S2aOQ/atG2yIMmGwG6pixSTHFX86crK29U44=; b=nZPGr2a0F2qRf9NxXO6mZjRdUz
	YULp/fugzz1sdDFNNCUvPe2dUNuxC7+KyhMw+LTxZz8VL5YEhq35CMe6xh6wL/q5qRws9K14efrN2
	WNFP2QDWv4R1Wl5hX45MJialGUQj6P+di7No5+wjnZm/s37aZcOyyPSFCFT5s52CBxYJj9SDGUa1q
	NDomkkOwKuE5uveXwm/IOZ9UirzZ3ck5Fy6JuFQxDpvk2CDFI4Rdr31oe5HIhL7FEKprftlh2icdx
	YdFtT5TjDHOzaxgrv3pfwSyOLZ/IkNAztLxvbuet8sqR69RaWL81Xctm0v+ngbWGKVoDn200ILPu/
	IvIdLZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDOmq-003Ttq-EI; Tue, 10 Aug 2021 10:15:08 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDOmk-003Tq1-GY
 for ath11k@lists.infradead.org; Tue, 10 Aug 2021 10:15:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MRkyqAjudaPjK5MEKe1nWN6xUtd1nJUe4QcpBNSpDGo=; b=n9Ky1IdFAkLwVUwSjFcimJMKNr
 k8qzdAj4BufsThlKVVv5mGQ8MiVPLom5fPgVVyIwB6liwbB956RGEXzw3PrZfO2bAqGoxr/c+iaBy
 RKb14GVzJl8lM6WaUaZLsUiziI4LHjDpinhFn2k3Shmw88FgvKeBUQuRRt8fNi+Fr5yA=;
Received: from p4ff13206.dip0.t-ipconnect.de ([79.241.50.6] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mDOmU-0006mP-AH; Tue, 10 Aug 2021 12:14:46 +0200
Subject: Re: [PATCH v5 1/3] nl80211: Add support for beacon tx mode
To: Maharaja Kennadyrajan <mkenna@codeaurora.org>,
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org
References: <1628585783-21139-1-git-send-email-mkenna@codeaurora.org>
 <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
From: Felix Fietkau <nbd@nbd.name>
Message-ID: <7eaa665c-7f9b-268c-5297-4d3851e10e43@nbd.name>
Date: Tue, 10 Aug 2021 12:14:45 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <1628585783-21139-2-git-send-email-mkenna@codeaurora.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_031503_241358_D4F04858 
X-CRM114-Status: UNSURE (   9.33  )
X-CRM114-Notice: Please train this message.
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


On 2021-08-10 10:56, Maharaja Kennadyrajan wrote:
> User can configure the below beacon tx mode
> 1. Staggered mode and 2. Burst mode while bring-up the AP
> or MESH.
> 
> Beacons can be sent out in burst(continuously in a single shot
> one after another) or staggered (equally spread out over beacon
> interval) mode.
> 
> Set the beacon_tx_mode as 1 for Staggered mode and 2 for
> burst mode.
What's the advantage of one over the other? When and why would the user
choose a different mode other than the default?

- Felix

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
