Return-Path: <SRS0=TjBW=IR=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5175C433DB
	for <ath11k@archiver.kernel.org>; Fri, 19 Mar 2021 08:20:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 49C5664DFB
	for <ath11k@archiver.kernel.org>; Fri, 19 Mar 2021 08:20:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 49C5664DFB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4h4VagH7Z0ZDdayR2PqA/elVklrQI82T0tz8zuTDTg8=; b=qTuAEBMS6+7Feu9qRqR4TGmdT
	bRnpANtOseh0EN00zrA+GSHiQGvxtpneG8AbfK5k1fhdAzGqXqW9MJE1WBr/aU6FW/+ZIctjf4Lqs
	87udWVaMrAUdkpL4gg37/UPrGI1VwuT8VM5DtgGdNWnGQTgFz8O/6MyqcAKtcGl7+XzBrw+yXN9cU
	8WKrtMrSI6RKzEW94JC1N3gH8H/Mz4LssAHGP0c59f6Wq/in9/GlbPnDKmtHG7yjWJX861H85NSMx
	JtM8dwXdFq4raMdp/F0AyzfTsz4wJDhzSaNKD8icqEjLiBg4PjI9EM4lh+3fchGq+i2r1cJlyFEQj
	S+QrqPcIA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lNAMQ-006sKV-Ui; Fri, 19 Mar 2021 08:19:59 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lNAMM-006sK6-L4
 for ath11k@lists.infradead.org; Fri, 19 Mar 2021 08:19:56 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1616141994; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=idNYfadOLoQkB1PFAwJpDdeYEP/DvBkdf7QVqRnWaTY=;
 b=eFLoNMm001wmaCkIzgLljDGw5SOUrfjQ22NJihtU8bWRCPu0LxXDe5lD9nSXlz/imDMHwhmm
 8Xs8dFmF1d5bXwe7t8GuGwfbRU6akzYG1MDRFaIdXszFY/OCAsxHQa+SmPUitklCFQdjHQkF
 pSFPGEm6CnfvNWWfIWMGtv9Kns4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60545ea921031618f68dc44f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 19 Mar 2021 08:19:53
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D03A1C43461; Fri, 19 Mar 2021 08:19:52 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: akolli)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8EFE3C433CA;
 Fri, 19 Mar 2021 08:19:52 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 19 Mar 2021 13:49:52 +0530
From: akolli@codeaurora.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: ath11k@lists.infradead.org
Subject: Re: [bug report] ath11k: Add qcn9074 mhi controller config
In-Reply-To: <YFNR+z1gab7MKkQv@mwanda>
References: <YFNR+z1gab7MKkQv@mwanda>
Message-ID: <794462b263f0e95da49d1118cc7c44cf@codeaurora.org>
X-Sender: akolli@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210319_081954_908015_7D6358B4 
X-CRM114-Status: UNSURE (   9.87  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hi Dan Carpenter,

> The patch a233811ef600: "ath11k: Add qcn9074 mhi controller config"
> from Feb 16, 2021, leads to the following static checker warning:
> 
> 	drivers/net/wireless/ath/ath11k/mhi.c:357 ath11k_mhi_register()
> 	error: uninitialized symbol 'ath11k_mhi_config'.
> 

I will fix this.

> drivers/net/wireless/ath/ath11k/mhi.c
>    342          mhi_ctrl->iova_stop = 0xffffffff;
>    343          mhi_ctrl->sbl_size = SZ_512K;
>    344          mhi_ctrl->seg_len = SZ_512K;
>    345          mhi_ctrl->fbc_download = true;
>    346          mhi_ctrl->runtime_get = ath11k_mhi_op_runtime_get;
>    347          mhi_ctrl->runtime_put = ath11k_mhi_op_runtime_put;
>    348          mhi_ctrl->status_cb = ath11k_mhi_op_status_cb;
>    349          mhi_ctrl->read_reg = ath11k_mhi_op_read_reg;
>    350          mhi_ctrl->write_reg = ath11k_mhi_op_write_reg;
>    351
>    352          if (ab->hw_rev == ATH11K_HW_QCA6390_HW20)
>    353                  ath11k_mhi_config = &ath11k_mhi_config_qca6390;
>    354          else if (ab->hw_rev == ATH11K_HW_QCN9074_HW10)
>    355                  ath11k_mhi_config = &ath11k_mhi_config_qcn9074;
> 
> ath11k_mhi_config not initialized for other revs.  Which seem to exist
> so this seems like it could be a real bug?

mhi.c is only for PCI devices and in current ath11k driver only these 
two
hw_rev uses ath11k_mhi_config.

Thanks
Anil

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
