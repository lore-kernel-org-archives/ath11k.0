Return-Path: <SRS0=kuZe=OG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3639C433F5
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:16:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 74F6E611C4
	for <ath11k@archiver.kernel.org>; Thu, 16 Sep 2021 09:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 74F6E611C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z74jitnaWpeDToqqzpUg3sp5INXegrWf0z59Jr6G6VA=; b=OgiD9iGZ01Ux+D
	vrvrsDuPO2yofW0jxlcjRYryp5wLDBfjfXrrl10Sk0T8WIwrG4VmA5jnCddD2zMAekr4ljssAZI2D
	cCV8g3Dr9xDUK4QajHHOZZ3SwCsPEbZpuG5iobQqjnKHegwmk9KduizNVnn4KXrXs4hs57P3/2nT1
	AgvqJbi9o7yhhVxAiEQ1+DDmAFXBuW/gc5nnJFworKQb7aFEVarFhIIghuR8H2K535vvQsyb+92w8
	BQtLpQO0Lz9NZIMcxahopa7FPcjlz9tdcBLzGMJUrQExaBQczWOABdUnEA0slqOe2cvhMD/T2P/mX
	pz53fTWAWK4oDjm6RoFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQnVA-00AezQ-7t; Thu, 16 Sep 2021 09:16:16 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQnV6-00Ae96-29
 for ath11k@lists.infradead.org; Thu, 16 Sep 2021 09:16:14 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631783773; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=dU4Zj6Bc6XMmEfqTT/EHCTOao20OJDLFZLLRcw85Pls=;
 b=IAAgeEBt5OMs8C1ZN+9bPk8r3xAdeIY7HP841lgURJj/EGPAThLVpq9Lwqn4dUTwvcddKqAU
 QPsrRGNBVfr6UK8NkqiPcGJE5Rh0bwR2HrVruZBDXgSM34ejZt32NwgaBhZAzS9g413lsbj0
 J5sRShLiXwoOX7CP61AY156Xa+s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 61430b4fb585cc7d24d1b515 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 09:15:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5831EC4363F; Thu, 16 Sep 2021 09:15:59 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C551C4314D;
 Thu, 16 Sep 2021 09:15:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 1C551C4314D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath11k: fix 4-addr tx failure for AP and STA modes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210720213147.90042-1-jouni@codeaurora.org>
References: <20210720213147.90042-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sathishkumar Muruganandam <murugana@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210916091559.5831EC4363F@smtp.codeaurora.org>
Date: Thu, 16 Sep 2021 09:15:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_021613_492374_675F13D5 
X-CRM114-Status: UNSURE (   9.60  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> Ath11k FW requires peer parameter WMI_PEER_USE_4ADDR to be set for
> 4-addr peers allowing 4-address frame transmission to those peers.
> 
> Add ath11k driver callback for sta_set_4addr() to queue new workq
> set_4addr_wk only once based on new boolean, use_4addr_set.
> 
> sta_set_4addr() will be called during 4-addr STA association cases
> applicable for both AP and STA modes.
> 
> In ath11k_sta_set_4addr_wk(),
> 
> AP mode:
>         WMI_PEER_USE_4ADDR will be set for the corresponding
>         associated 4-addr STA(s)
> 
> STA mode:
>         WMI_PEER_USE_4ADDR will be set for the AP to which the
>         4-addr STA got associated.
> 
> Tested-on: IPQ8074 WLAN.HK.2.1.0.1-01238-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sathishkumar Muruganandam <murugana@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

2 patches applied to ath-next branch of ath.git, thanks.

34c67dc36641 ath11k: fix 4-addr tx failure for AP and STA modes
e20cfa3b62ae ath11k: fix 4addr multicast packet tx

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210720213147.90042-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
