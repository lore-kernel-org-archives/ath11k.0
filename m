Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588F5C4332F
	for <ath11k@archiver.kernel.org>; Tue,  8 Nov 2022 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUPKQpDwuZQjfvWB/eZFXky1+eWuTxBoD1rJbTLFjjM=; b=HRi+AqgNHrwxUK
	dVL9//vbSmfec15FHTOfCb5bI0rN1hwmVUXPK4UP6F7TJezsXTZTtQISDZa/PoxmrFELd8UqpOxKR
	miwmwL1yIk0beJmVJ6zUzVqLxh8/qeUAFwYBKbHdK+omv8latC0E1vLr3QLmIRMK8yCNs5Sesg2G6
	L58reB/GOQmoHwUuSU2nH/0Eu6emH+36YwfXZ2J4NQbIBB5E8n2VvU/YHOo4tbGSMayL73vtm4y4B
	TA8fLNnyI8DgzSE3h5Pnmr9MulQHCFKBK610qJQh9k18xd+3K5zFDZGCXzPOPTYQFs4a2nGxvUqcH
	w9q6yEThsUa6hZW4hrSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLs0-004Swk-C4; Tue, 08 Nov 2022 10:30:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osLrx-004SvL-7j
	for ath11k@lists.infradead.org; Tue, 08 Nov 2022 10:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6A58C614EB;
	Tue,  8 Nov 2022 10:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1302AC433D7;
	Tue,  8 Nov 2022 10:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667903411;
	bh=QScj0SPWiAoUuCjvCzfGcgNluCdjviFFK4yyG9xTUTA=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=YWeCvuNtkh38gLaCWRbJiHi7ors2Xznh8Ga26ofr+FraGaVxfBYsDBaFTWDbuOo8k
	 2eNP5PJ7pwpEfqgrbLNUolY3p57MfQ3f1T3h4UFrcA4lsgYqVSVV9NlhceHCYwgD4r
	 i2fOC7cHZI1+JyDnF67KKQ/L4tgOdcWgtoABweRdmENvYqzw8BaI+guMHTkKipBUcI
	 +Y/dZ1KUDzYJgymyRBPkWNMALOF2RQd7+z6ixvxZ6xCMbHfFTdPnGG2C3fhntxQiol
	 nixHjzeEXJg4GpJUmvH4MVQ9FPXipQ5zLMvVaseRspuf60ltx6tattvs76SPbEsvo9
	 IZknsBhAuvLUg==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath10k: Add WLAN firmware image version info
 into
 smem
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221104082828.14386-1-quic_youghand@quicinc.com>
References: <20221104082828.14386-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
 <linux-arm-msm@vger.kernel.org>,
 "Youghandhar Chintala" <quic_youghand@quicinc.com>,
 kernel test robot <lkp@intel.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166790340662.9633.4549756749859911615.kvalo@kernel.org>
Date: Tue,  8 Nov 2022 10:30:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_023013_347278_9541A4FE 
X-CRM114-Status: GOOD (  14.04  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
> 
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
> 
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
> 
> This change is applicable only for WCN399X targets.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

This doesn't compile unless QCOM_SMEM is enabled in Kconfig. So should we add
"select QCOM_SMEM" in Kconfig for ATH10K_SNOC?

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221104082828.14386-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
