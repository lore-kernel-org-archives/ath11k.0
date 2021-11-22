Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C681C433F5
	for <ath11k@archiver.kernel.org>; Mon, 22 Nov 2021 14:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNUt83+kiomYBiPugKxce+k3/9wM7jjjb/14kexzgYI=; b=C/usQwd41aCpec
	5DpVzig3k5SHWJRRC7ka0LEHeE38qz1AOUGNUW2IbTaCow/zRdRHrlWuQN2YndPvilU62qMtHriZ1
	4OAhqKgsbIpDqnBzJI3MVvqPH4xpEjul0mi0tcPAC0D7Jx5tk69URVYY0RZhEwdONLxDxbZ85mtUH
	xcGIJXLoHcLgAgCrKi7JOgw4j3fHv2iNAZwZ2DVxWUGCn/jkDWkcWHOktU7m6JNqr41TyNi1NrBgk
	BWsXhBLsQlTR6vKI2mU7aAs8FTi3PuGdwOKAb5kf73TZt7HI/bk6g6CvJoOemf18a7Q2hRGAbnwAW
	9iV0fll9K86ma9YTb58A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpAPc-00Gsm4-7i; Mon, 22 Nov 2021 14:35:16 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpAPN-00GsCS-37
 for ath11k@lists.infradead.org; Mon, 22 Nov 2021 14:35:15 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1637591713; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=WNBSXVQoNFNhvohQ98lEnNls0MW3PeFjax9xKqQgbno=;
 b=ZZ02wtYHu43rjUwTTpBfJcJ6oywnp4CntlkhUqzo1UvFLlEFL2/fKlQavjS9SqHAgXvG99hC
 +L5ihnkpccxRo4y//DoTxK7BREA+3MIESDPC6IIUgEemKmfLMb73eHCuqRN+uqb93HVtWNj0
 fu7I4Z+dbkUtNu6aMizbTHoiZpo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 619baa7a86d0e4d8887422c4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Nov 2021 14:34:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1B8E2C4360C; Mon, 22 Nov 2021 14:34:34 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A830BC4360D;
 Mon, 22 Nov 2021 14:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A830BC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath11k: skip sending vdev down for channel switch
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211118095901.8271-1-quic_wgong@quicinc.com>
References: <20211118095901.8271-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163759167100.17469.7976011024924316593.kvalo@codeaurora.org>
Date: Mon, 22 Nov 2021 14:34:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_063514_056251_268B64D4 
X-CRM114-Status: UNSURE (   8.71  )
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

> The ath11k driver currently sends vdev down to the firmware before
> updating the channel context, which is followed by a vdev restart
> command.
> 
> Sending vdev down is not required before sending a vdev restart,
> because the firmware internally does vdev down when ath11k sends
> a vdev restart command.
> 
> Firmware will happen crash while channel switch without this change.
> 
> Hence skip the vdev down command sending when updating the channel
> context and then fix the firmware crash issue.
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a4146249a333 ath11k: skip sending vdev down for channel switch

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211118095901.8271-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
