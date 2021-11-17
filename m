Return-Path: <SRS0=L+f/=QE=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137A4C433EF
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:29:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C7E8D61B66
	for <ath11k@archiver.kernel.org>; Wed, 17 Nov 2021 07:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C7E8D61B66
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NXBlx3UE1IUkQEenuAwSOgqCuMt4FCuKCn3IVSf+Zb0=; b=1kyEIyYTlO3pFo
	kaH8Oc+xy8Tg0K1EpDnZC25DaRS2IKFPsr41KaDBqrV3rKNJnpJxxeZg2qYygcWvPEuM6h/mpfB0A
	C8mZeOFII0eb2QYupeXoH+jLAON0rgYwGa8QlPRDIZX5mzZIHZESstS60o+gf58nwPDouxUHycHa9
	z3O41vhShOYdVeF5CVNu72/ym0JgzGpsNn1+Dij/Z/raztvv/eHBqmpOoedK0zZX7hgaozCrkA9mV
	/kVGVAFyRe62MjI7NSQKIkyAteCsgz9SfcOkikgMkOW0e36ftuvzIczIr1l3oH/zvVElNuK0e1BYr
	bK9gRYEsRk7slhkIlJBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFO9-003nnG-Ol; Wed, 17 Nov 2021 07:29:49 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFO6-003n3X-DU
 for ath11k@lists.infradead.org; Wed, 17 Nov 2021 07:29:48 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637134186; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=XbO7mzpxWdT7BlrPjC/8KECIfX1n/8CZNR5jOCgeZgA=;
 b=rhwOX5l5nGCeZ034jP5sP7GuSB7CODhSUiIcKjzfAa2Fq6C/wlm4qeCM/PJtYAe6Abd1A3Gh
 9Rs4WYdWeS/xu+y9/2B1pV9xEwXcG+sFzyZOdmT7hqjr2jcZiQfuhA3m7N8A0E4w+LBWlcqi
 eLgJ4AwvBpT9TDrZHu0gnRGII1w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 6194af0e638a2f4d61169272 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Nov 2021 07:28:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 733A5C4360C; Wed, 17 Nov 2021 07:28:13 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 857A3C43460;
 Wed, 17 Nov 2021 07:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 857A3C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: Disabling credit flow for WMI path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1635156494-20059-1-git-send-email-quic_ppranees@quicinc.com>
References: <1635156494-20059-1-git-send-email-quic_ppranees@quicinc.com>
To: P Praneesh <quic_ppranees@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 P Praneesh <quic_ppranees@quicinc.com>,
 Pravas Kumar Panda <kumarpan@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163713408935.31320.4287583545861916111.kvalo@codeaurora.org>
Date: Wed, 17 Nov 2021 07:28:13 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_232946_602093_A87EB5E9 
X-CRM114-Status: GOOD (  12.59  )
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

P Praneesh <quic_ppranees@quicinc.com> wrote:

> Firmware credit flow control is enabled for WMI control services,
> which expects available tokens should be acquired before sending a
> command to the target. Also the token gets released when firmware
> receives the command.
> 
> This credit-based flow limits driver to send WMI command only
> when the token available which is causing WMI commands to timeout and
> return -EAGAIN, whereas firmware has enough capability to process the
> WMI command. To fix this Tx starvation issue, introduce the ability to
> disable the credit flow for the WMI path.
> 
> The driver sends WMI configuration for disabling credit flow to firmware
> by two ways.
>         1. By using a global flag
>                 (HTC_MSG_SETUP_COMPLETE_EX_ID msg type flags)
>         2. By using a local flag
>                 (ATH11K_HTC_CONN_FLAGS_DISABLE_CREDIT_FLOW_CTRL = 1 << 3)
> 
> Ath11k uses both these configurations to disable credit flow for the
> WMI path completely.
> 
> Also added a hw_param member for credit flow control by which we can
> enable or disable it based on per-target basis. Currently we are disabling
> credit flow for IPQ8074, IPQ6018, and QCN9074 as recommended by firmware.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.4.0.1-01492-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ6018 hw1.0 AHB WLAN.HK.2.4.0.1-00330-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Pravas Kumar Panda <kumarpan@codeaurora.org>
> Signed-off-by: Pravas Kumar Panda <kumarpan@codeaurora.org>
> Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f951380a6022 ath11k: Disabling credit flow for WMI path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1635156494-20059-1-git-send-email-quic_ppranees@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
