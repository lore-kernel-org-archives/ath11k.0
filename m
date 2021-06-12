Return-Path: <SRS0=cw7w=LG=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75B13C48BCF
	for <ath11k@archiver.kernel.org>; Sat, 12 Jun 2021 10:31:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22203610A7
	for <ath11k@archiver.kernel.org>; Sat, 12 Jun 2021 10:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22203610A7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/AbyrEGyssgJNflFM5bJuP+j7iAL13YwM+zx27ZNYdA=; b=bpT7Yt0XPRdjcU
	/Cx3LlUE56ZfpLrNy2qKidjjg/2DO/JOz72j7X8Il5T+jakLHZbS6kcsIhquowmlZPitbbqZmnPc0
	AQKyB7a6PbT+SCbZ5lvoQZM2vTnFSROg57dh1PkDfQi+Ze6qXzzx04hjKY9ASNTMVXTNB2PAPReSQ
	HazcJp0s6rYgMLKNHxVcgwPXp4EJIXVnvfCUIzwNP2nDaeDoTngavo1pXP0d1H5fez3oMdMRBC7Rv
	wfU6vfwulEc0toZsPzPrYwn6bzyPSUt2HruBBHoqLP1Yz/9gr7H5vHRFp42noK1MC9R3/xOTo32cC
	4cAf5uT8fRRcBVh1ip+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls0vP-008IIp-6q; Sat, 12 Jun 2021 10:31:35 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls0vM-008IIT-GU
 for ath11k@lists.infradead.org; Sat, 12 Jun 2021 10:31:33 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623493891; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=WYhAij5didyRMDoFtERoOpr07Z4/8PXzHPjXz3ajra8=;
 b=AhJeAwO1cs6WNzRnREOAjr9sg6RX83Y5if0/ITvzCBIxFBpd+eMzELe8dBFYgeB/wVdMF6x6
 xuZM8I96kRVozuC0ac2+2JXeyTyDtA6QhOvkKFuDiaakoVppVFpX2AxjVdNWsf489gswoq0w
 yELKDuNqBLK5xlfHSDhWIUQLQpk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 60c48d0251f29e6baeac5418 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 12 Jun 2021 10:31:30
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2A09BC433F1; Sat, 12 Jun 2021 10:31:29 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id E710DC433D3;
 Sat, 12 Jun 2021 10:31:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E710DC433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] ath11k: add hw reg support for WCN6855
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210511162214.29475-2-jouni@codeaurora.org>
References: <20210511162214.29475-2-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Baochen Qiang <bqiang@codeaurora.org>, Govind Singh <govinds@codeaurora.org>, 
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210612103129.2A09BC433F1@smtp.codeaurora.org>
Date: Sat, 12 Jun 2021 10:31:29 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_033132_632946_7F627C86 
X-CRM114-Status: UNSURE (   7.45  )
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

> Reg address of WCN6855 is different from other devices,
> so add separate reg definition for this target.
> 
> Tested-on: WCN6855 hw2.0 PCI WLAN.HSP.1.1-01720.1-QCAHSPSWPL_V1_V2_SILICONZ_LITE-1
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Signed-off-by: Baochen Qiang <bqiang@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

7 patches applied to ath-next branch of ath.git, thanks.

755b1f73173e ath11k: add hw reg support for WCN6855
e4073430ee1d ath11k: add dp support for WCN6855
0d55b76fd815 ath11k: setup REO for WCN6855
ed66849e159b ath11k: setup WBM_IDLE_LINK ring once again
8845fed1ad7b ath11k: add support to get peer id for WCN6855
0fbf19570099 ath11k: add support for WCN6855
5088df0504fe ath11k: don't call ath11k_pci_set_l1ss for WCN6855

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210511162214.29475-2-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
