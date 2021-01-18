Return-Path: <SRS0=R0Ww=GV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C012C433E0
	for <ath11k@archiver.kernel.org>; Mon, 18 Jan 2021 16:38:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD07F2245C
	for <ath11k@archiver.kernel.org>; Mon, 18 Jan 2021 16:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD07F2245C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JvjIsPLbpguz70UGK76G1gTA/O03E74PPjutDwzSUto=; b=MEtsZOGuXsLmgWJpyKky68Hka
	omXmqeN05FaPIOuvTaqAiJHXkEcwc7GAJT4cW6zwvsiL2wOn1SvCRYyxq1hzxyBfeQvUXzEINETt+
	hpOMUE0KrriKJxFuXxlbML/7vuNwCjOTmNjVHgF+QbNGRMCvOy5nrDaZFa03vtD4wYc8Ug/hWQCr9
	EA8LJNll8TgASaDZ83HOGbzl1WMkyPDorhRxv49Y1iz4T4fqkLThwCh3UpDZmiSII0eC4ZtVZpCHT
	2SblG32LFLHsZ29lJJKTy4f5TqBdUQQ4CwF0V5awdpk3EvUZZ+Tm3ZUEHHRvL3jT9AL0qQXQIxonK
	ui2rRrcyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1XXv-000688-Ps; Mon, 18 Jan 2021 16:38:27 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1XXs-00067S-G5
 for ath11k@lists.infradead.org; Mon, 18 Jan 2021 16:38:26 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610987905; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=4y4QUpioQ/d+gCmHKOd4UCjbYz4QrhmNC4FQaweBrCk=;
 b=v2C/30P7m+g+BiIWaVd58OXH2m64iOkL/DjSmhwvdGZ5QAmDQZ3maAXnoxAL3T0ToG48C2JM
 lsEaJgfbFeSzBr5r5pzCFq56S7SLlDvBMnMNdXu0RfrBVwNRkklhpevLi/NuN3TbBx08zjN5
 I6uafNfxBrFOaGEwMl4mZ6LqTqY=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6005b97eba7f86850652353e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 16:38:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 3E3C5C433ED; Mon, 18 Jan 2021 16:38:21 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 97A0FC433C6;
 Mon, 18 Jan 2021 16:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 97A0FC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH] ath11k: add ieee80211_unregister_hw to avoid kernel crash
 caused by NULL pointer
References: <1608607824-16067-1-git-send-email-wgong@codeaurora.org>
Date: Mon, 18 Jan 2021 18:38:17 +0200
In-Reply-To: <1608607824-16067-1-git-send-email-wgong@codeaurora.org> (Wen
 Gong's message of "Tue, 22 Dec 2020 11:30:24 +0800")
Message-ID: <87turefbeu.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_113825_565958_2401166F 
X-CRM114-Status: GOOD (  12.21  )
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Wen Gong <wgong@codeaurora.org> writes:

> When function return fail to __ath11k_mac_register after success called
> ieee80211_register_hw, then it set wiphy->dev.parent to NULL by
> SET_IEEE80211_DEV(ar->hw, NULL) in end of __ath11k_mac_register, then
> cfg80211_get_drvinfo will be called by below call stack, but the
> wiphy->dev.parent is NULL, so kernel crash.

[...]

> +err_unregister_hw:
> +		ieee80211_unregister_hw(ar->hw);
> +
>  err_free_if_combs:
>  	kfree(ar->hw->wiphy->iface_combinations[0].limits);
>  	kfree(ar->hw->wiphy->iface_combinations);

Incorrect indentation, I'm surprised checkpatch doesn't catch that. But
fixed this in the pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
