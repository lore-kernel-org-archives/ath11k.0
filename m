Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3159DE7E65D
	for <ath11k@archiver.kernel.org>; Tue, 26 Sep 2023 19:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nRr65s4eAps4zGEweDxq3NxfgbhOYiV50qUIXVXECro=; b=m4wznKf6CHZVc+
	ywtbH0RfaF4vid3tHBltXFOeNEhjzyqOAIERjSKj5ZMEUzTsPs05aZCp34sDWbJ3GQuxoHZiOIVAv
	Ey7FInVaFi9whayhl+wIDgMTa5AR34iXLcpBtFWqtOpjZn7SPRAwG6lL2VfMvr/nfn3O1aBcVLBOe
	vRZuOxuL0PkfMdWe7E6ROjFFfpJ+scH/UfGsMHm6ipi9XcN0G3EV23ymK5MZThxyoPqt/Bdhoha+L
	x8q1KOwNji1ZoRm37XktCuOofpZTyB9qfPhPUVNGB4WvjD08wc//KIL/9J94hv+GNXNvX5VX9ROyK
	G0i+axhvusqE8jlNqewg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlDNg-00GuEv-1N;
	Tue, 26 Sep 2023 19:06:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlDNd-00GuDq-0B
	for ath11k@lists.infradead.org;
	Tue, 26 Sep 2023 19:05:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 88E2DB811BE;
	Tue, 26 Sep 2023 19:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303D3C433C7;
	Tue, 26 Sep 2023 19:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695755154;
	bh=7wY1yolZBWdNMw1lFtLTpWHClKu+sx6vQPHOLa38gm4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=V4Q1hwIbrhlonESOxBBuVzhtJhEWhEVya23Pkw282wJdvw9c0V0tIO8wG8/xOVLXw
	 LmDMeAxtt9IezHDssvwaBnc3sEFkkT1JOYY0EydOKddUTamp9PE3CQKV77NNy+r5jB
	 P+eWS0vmTX3OqaTqizdawvmvb3CMdm81LIcHAsIrg4ruEiXRR0z+m5jiCOMgxw/7zA
	 dAX0d0UtDFdr4VSQtQqhc/cZYe6ZG3xI4pME+RElTleWvlmRHtjOc4f5wbNFSw0myW
	 md5d1V/NjHl8K9jO2PxJuvlUa6Dlqb2TON2ZT1bvlt8HjM4sXWDyuvIpZuOY+Zj/qI
	 cVI5RdCQ6mQug==
From: Kalle Valo <kvalo@kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: ath11k@lists.infradead.org,  linux-wireless@vger.kernel.org
Subject: Re: [PATCH v2] wifi: ath11k: mac: fix struct
 ieee80211_sband_iftype_data handling
References: <20230926163350.2641064-1-kvalo@kernel.org>
	<49b5de54ca00f5521ceaa8210f587f2af48d6835.camel@sipsolutions.net>
Date: Tue, 26 Sep 2023 22:05:51 +0300
In-Reply-To: <49b5de54ca00f5521ceaa8210f587f2af48d6835.camel@sipsolutions.net>
	(Johannes Berg's message of "Tue, 26 Sep 2023 18:43:56 +0200")
Message-ID: <87fs3092ls.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_120557_325192_72C6DE10 
X-CRM114-Status: UNSURE (   8.94  )
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

Johannes Berg <johannes@sipsolutions.net> writes:

> On Tue, 2023-09-26 at 19:33 +0300, Kalle Valo wrote:
>> 
>> - he_mcs_map =
>> le16_to_cpu(ath11k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));
>> +	he_cap = ieee80211_get_he_iftype_cap_vif(sband, arvif->vif);
>> +	he_mcs_map = le16_to_cpu(ath11k_mac_get_tx_mcs_map(he_cap));
>
> Technically, ieee80211_get_he_iftype_cap_vif() could return NULL if you
> didn't actually configure/enable HE for this iftype, the static checkers
> might complain here.

And this is even mentioned in the documentation which I failed to see:

 * Return: pointer to the struct ieee80211_sta_he_cap, or %NULL is none found

Thanks! I'll fix this in v3.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
