Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ACCFCD4F39
	for <ath11k@archiver.kernel.org>; Thu, 14 May 2026 06:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gx9J2zQCCR0v83fPqRH4Wf+USVyuXb4hC/B1FjQBSfM=; b=WP13Yy9NtNm1j4PpR/BHkzT+K9
	H11H4jdofBTEXkHjvy4jkUFpJiSqIqpjDW5lVixVoktTWon1+6VA86eatY3X3uqVN6Bes8oWEnnuA
	qtn7r5UItYjXeI5jwDLFhHij098vJlavgq5t5eaOysjkfcaJc8XtCvpbO7tVsd5oAdl/Kmmsy8RIK
	3EmTOrg0xWoiCAf7YELHHVtrWIHh5l4zNGIxS5aIdLN8p4PX3CqaFnVTmyAdy4amdjaktrYeJBE+H
	UU0BQrpjSgBJccqGCtBdhKYSTYl/t6rjYslfkIf6vFF1DcakqJIvL4nFgLYtTLKVplGSCfE9elTAL
	y1GF6jKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPPP-00000004hMT-1RDB;
	Thu, 14 May 2026 06:18:59 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNPPN-00000004hM3-1SnT
	for ath11k@lists.infradead.org;
	Thu, 14 May 2026 06:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1778739534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gx9J2zQCCR0v83fPqRH4Wf+USVyuXb4hC/B1FjQBSfM=;
	b=JKS5OKGG+NlCRbAqyzJNwgkFwOu5YjQmko/yF27mbtjrQeJvPc4UgNyGJYMSkK53Mj75Yk
	7HLIHrnhRpaNIb741NlQbyFodC83FEFFLjtyuX5a9NhNr57iAm3BUYXEx8poFfHSjiKxat
	Z8rjsp6M/pxL64COBC5c3jdlZJwLd18=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-eSeZBx29N8Oz51wzAnDxAQ-1; Thu,
 14 May 2026 02:18:48 -0400
X-MC-Unique: eSeZBx29N8Oz51wzAnDxAQ-1
X-Mimecast-MFC-AGG-ID: eSeZBx29N8Oz51wzAnDxAQ_1778739527
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D3F0119560AA;
	Thu, 14 May 2026 06:18:46 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.46])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 1F2E71955F22;
	Thu, 14 May 2026 06:18:43 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jtornosm@redhat.com
Cc: ath11k@lists.infradead.org,
	jjohnson@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	rameshkumar.sundaram@oss.qualcomm.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: ath11k: fix warning when unbinding
Date: Thu, 14 May 2026 08:18:40 +0200
Message-ID: <20260514061841.9517-1-jtornosm@redhat.com>
In-Reply-To: <20260507070808.367442-1-jtornosm@redhat.com>
References: <20260507070808.367442-1-jtornosm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 6aWhChNIs4S_O3KEnhZvZG2lw8_I_EBrOe09AxKZnUk_1778739527
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_231857_465765_2DF02FC3 
X-CRM114-Status: GOOD (  15.25  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Hello Rameshkumar,

> I agree that setting tx_status to NULL makes ath11k_dp_free() more
> defensive, and it matches the ath12k fix.
Ok, I agree too.

> However, i am still wondering how the second ath11k_dp_free() is reached 
> if ATH11K_FLAG_QMI_FAIL is set.
>
> In ath11k_pci_remove(), when ATH11K_FLAG_QMI_FAIL is set, we take the
> qmi_fail path and skip ath11k_core_deinit(). So the normal remove path:
>
>     ath11k_pci_remove()
>       ath11k_core_deinit()
>         ath11k_core_soc_destroy()
>           ath11k_dp_free()
>
> should not run.
>
> So if the double free is still reproducible with QMI_FAIL set (with the 
> change i proposed), either the flag is not actually set in this failure 
> case, or there is another path calling ath11k_dp_free() ?
Let me try to clarify the issue more.
There are two error actions:
- First the previous error. I reproduce the situation as I commented: running
in a VM the default upstream kernel (with this card using PCI passthrough),
since this is always failing. Let me show the logs in this situation:
[   15.906564] ath11k_pci 0000:07:00.0: BAR 0 [mem 0xfdc00000-0xfddfffff 64bit]: assigned
[   15.926520] ath11k_pci 0000:07:00.0: MSI vectors: 32
[   15.928572] ath11k_pci 0000:07:00.0: wcn6855 hw2.0
[   16.984192] ath11k_pci 0000:07:00.0: chip_id 0x2 chip_family 0xb board_id 0xff soc_id 0x400c0200
[   16.984351] ath11k_pci 0000:07:00.0: fw_version 0x11088c35 fw_build_timestamp 2024-04-17 08:34 fw_build_id WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
[   18.186971] ath11k_pci 0000:07:00.0: failed to receive control response completion, polling..
[   19.211036] ath11k_pci 0000:07:00.0: Service connect timeout
[   19.211815] ath11k_pci 0000:07:00.0: failed to connect to HTT: -110
[   19.214181] ath11k_pci 0000:07:00.0: failed to start core: -110
[   19.531989] ath11k_pci 0000:07:00.0: firmware crashed: MHI_CB_EE_RDDM
[   19.532930] ath11k_pci 0000:07:00.0: ignore reset dev flags 0xc000
[   29.259157] ath11k_pci 0000:07:00.0: failed to wait wlan mode request (mode 4): -110
[   29.259229] ath11k_pci 0000:07:00.0: qmi failed to send wlan mode off: -110
- Second after this, I commanded the unbinded (ath11_pci) and I get the
warning. Let extend here the stack trace:
[   24.238198]  ? free_large_kmalloc+0x57/0x90
[   24.238199]  ? report_bug+0x16b/0x180
[   24.238210]  ? handle_bug+0x3c/0x70
[   24.238218]  ? exc_invalid_op+0x14/0x70
[   24.238218]  ? asm_exc_invalid_op+0x16/0x20
[   24.238224]  ? free_large_kmalloc+0x57/0x90
[   24.238227]  ath11k_dp_free+0x99/0xb0 [ath11k]
[   24.238275]  ath11k_core_deinit+0x12b/0x1a0 [ath11k]
[   24.238287]  ath11k_pci_remove+0x7b/0x120 [ath11k_pci]
[   24.238294]  pci_device_remove+0x3e/0xb0
[   24.238304]  device_release_driver_internal+0x193/0x200
[   24.238315]  unbind_store+0x9d/0xb0
[   24.238320]  kernfs_fop_write_iter+0x13a/0x1d0
[   24.238330]  vfs_write+0x32e/0x470
[   24.238335]  ksys_write+0x5f/0xe0
[   24.238336]  do_syscall_64+0x5f/0xe0
Very easy to reproduce.

Anyway, although you can avoid a specific path, IMHO this small fix is
recommendable to avoid other similar situations.

Thanks

Best regards
José Ignacio


