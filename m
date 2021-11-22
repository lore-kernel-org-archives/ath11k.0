Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D219C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXq9cMY+X/i6q1MCdZAG3uRwBgk5BkNbGgte4SSszog=; b=qSGHkI48ad1FpV
	HKSFwt9u/kn1Yij/A4yKhNne77wECP7WZXooUBSEVAT8B/HVx2XJNUxy8WfMAfTRpl8ze6k+NqlVX
	NQamYkXaSE2cuiokzz1OL3Fo8/YXZYrBxrPYMC4sxh1IsOKg9WsivVkBSUHpfRb4CXWRHSdSp95Dd
	6+dmOoSCAA2EnwzFuqX32xSpHpy8ambhbzCLd2jfyAdYBPD3u7N7BvwGoM4QNXM6zMWovM0SQNDO3
	nNUI30Q1QaWnnsody1Ba9OPCDxBnGc8qZBYOhWLhiZKqX2A1We4Fb65DGzMtVFapEK4JyS6SqEDjs
	hdlqPdkJhPlVOSiIM8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpANP-00Gs43-3l; Mon, 22 Nov 2021 14:32:59 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpANL-00Gs2t-TA
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:32:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591575; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=TKhRCxIJj2u7G9OxNBQXIg+ftBnB/qrTgAnwoSjFkf4=;
 b=wFOQ7/PdBrRLu5N9d0nZzCCnadJtBeTSjSUKFP1fkGvEhy8nv21SiNxdlZhmbxp5u803FSG0
 /tVfaAarj5VDJ8kRBk3zoRVO7OnoN1j9DTpvBev4AyFAXB3kTpaeACR1aa/7r+IaH6EvrN3s
 qJqXsUn2uCDKF0R2O2owtbXjuKs=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 619baa17e7d68470af8ecf48 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:32:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 4FA7EC43617; Mon, 22 Nov 2021 14:32:54 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9F258C4338F;
 Mon, 22 Nov 2021 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9F258C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: change to treat alpha code na as world wide
 regdomain
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118094848.7776-1-quic_wgong@quicinc.com>
References: <20211118094848.7776-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163759156907.17469.10507111815107265234.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 14:32:54 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063256_026007_23DBB387 
X-CRM114-Status: UNSURE (   7.03  )
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

Wen Gong <quic_wgong@quicinc.com> wrote:

> Some firmware versions for WCN6855 report the default regdomain with
> alpha code "na" by default when load as a world wide regdomain, ath11k
> should treat it as a world wide alpha code.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

f8108250e331 ath11k: change to treat alpha code na as world wide regdomain

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118094848.7776-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
