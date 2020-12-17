Return-Path: <SRS0=ZjKK=FV=lists.infradead.org=ath11k-bounces+ath11k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E464C4361B
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:46:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0664423884
	for <ath11k@archiver.kernel.org>; Thu, 17 Dec 2020 06:46:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0664423884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e+tyExtnNbrPOvlH4FPwNgA9DKUDZIYQqYz7asjaC9M=; b=ucc+M5PZkIGyndpgKxsUeOyw9
	gUmVYTDplAThbXppChvhwuSEe7seg53Zb3CkFpAkwstcs+arDj1DiwyAym9I9wA+xnALsmBMuT1WI
	zYt/ogCWqmjBDPicI7RaHW243SvQ6ohvOSt0R5VBS8U+a6Uj8Lvk06reFLyvYmaxvCO0m2RWXB3+S
	T9QXwOrs/T0GoIz+krkogxzBhgsW0fosdQpb/akTHD6l0xmvSLW4O0M5H441SvkDDDoKJkeDhWEQ7
	Nl404E0GF9+xx+76uDKBSepvRR9I3DFa7bmQZfwu6rkasRcaVudHbqdaZkreZYim07pK16qH1Lurn
	3oj9XzmgA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpn3d-0001Tj-5u; Thu, 17 Dec 2020 06:46:37 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpn3a-0001Oq-T5
 for ath11k@lists.infradead.org; Thu, 17 Dec 2020 06:46:36 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187594; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=JjsO2RQXw5ni68FpX2GXNXsulFW41zzp1/gzEh8ApkY=;
 b=NufiAr8eZuivUdCjhB+1hF+M+dM3NEd8OydqjYk6JHT5hwYBPJg/5YvEXM+lRZopo7rjTozZ
 g4felfJASnuIMHI2SgptFOVFC4FH/opDC2P+czzDAghsXaW2NdRBBRTQlmekjjAqaENSnJwl
 eocJKMQbwzrOd4LWdC1yvdbXRnc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJmOGQ2ZiIsICJhdGgxMWtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fdafeca93a3d2b1cd88a873 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:46:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id A153FC433CA; Thu, 17 Dec 2020 06:46:34 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 61CA5C433C6;
 Thu, 17 Dec 2020 06:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61CA5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath11k: fix crash caused by NULL rx_channel
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201211055613.9310-1-cjhuang@codeaurora.org>
References: <20201211055613.9310-1-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201217064634.A153FC433CA@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 06:46:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_014635_263423_55BD8462 
X-CRM114-Status: UNSURE (   9.24  )
X-CRM114-Notice: Please train this message.
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

Carl Huang <cjhuang@codeaurora.org> wrote:

> During connect and disconnect stress test, crashed happened
> because ar->rx_channel is NULL. Fix it by checking whether
> ar->rx_channel is NULL.
> 
> Crash stack is as below:
> RIP: 0010:ath11k_dp_rx_h_ppdu+0x110/0x230 [ath11k]
> [ 5028.808963]  ath11k_dp_rx_wbm_err+0x14a/0x360 [ath11k]
> [ 5028.808970]  ath11k_dp_rx_process_wbm_err+0x41c/0x520 [ath11k]
> [ 5028.808978]  ath11k_dp_service_srng+0x25e/0x2d0 [ath11k]
> [ 5028.808982]  ath11k_pci_ext_grp_napi_poll+0x23/0x80 [ath11k_pci]
> [ 5028.808986]  net_rx_action+0x27e/0x400
> [ 5028.808990]  __do_softirq+0xfd/0x2bb
> [ 5028.808993]  irq_exit+0xa6/0xb0
> [ 5028.808995]  do_IRQ+0x56/0xe0
> [ 5028.808997]  common_interrupt+0xf/0xf
> 
> Tested-on: QCA6390 hw2.0 PCI WLAN.HST.1.0.1-01740-QCAHSTSWPLZ_V2_TO_X86-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-current branch of ath.git, thanks.

3597010630d0 ath11k: fix crash caused by NULL rx_channel

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201211055613.9310-1-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
