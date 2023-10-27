Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E276AC25B67
	for <ath11k@archiver.kernel.org>; Fri, 27 Oct 2023 06:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N6QLOwAH7s0Tv3Ix+wQR0CqplNw2ilyj7TI+hcs7C6Y=; b=HkVgO5pvXVeIti
	fOEoa8bQKXQA0edRYi75UKzulfnlaeQNCblY6XsGj5eDTyLPSAMpHftQA/7wyrElIVptltnKiqTR1
	WayhpUfrIEiMaOsxkP0UIg4n7+UUT91yNArBrQuEb2C+RnjFbaRUBw49h4tZn6xOd2AECDzpa5BMN
	1/A5DqUdnH7Z6A2H0udDpNgOYwxFCz9e09t2UI3y8rWlCUI4dxXEuvphKYABdY+yZwoGKgaHnimJl
	FW+HD2GaTU8a4eA5b/8+TSqCo5Ydl0lD3vIR+ht5TMVZtJIrNgxdN4AA6Ga/I0r+8SinCKTdnMCuE
	4RxcopCnJLf/OVmnrcew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGme-00FiRZ-2u;
	Fri, 27 Oct 2023 06:57:29 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwGmc-00FiQp-29
	for ath11k@lists.infradead.org;
	Fri, 27 Oct 2023 06:57:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9ba1eb73c27so268272666b.3
        for <ath11k@lists.infradead.org>; Thu, 26 Oct 2023 23:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1698389841; x=1698994641; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kj3Zu6WMlpxQr17sM16EXcoz5cOx2Zq8aggknXeJGWY=;
        b=sPtxzTLwVsmJoBigd6S40r54CoGiexOAhHqt4i0iGvXb6e8L0xieqm6jDtLgdMYSy0
         xVVko1/KiQHNkllOotInnFdw8r5Yp2WjpwYlEtVIMKEooj/l3jiOiXyOGMZUAkyURe81
         tPK/nz/6TZTVQEln/17scMoVmfCKJ+hxdWjRAOA57liB/Nliu6uLMKaaEaHkAosPV7+p
         921ylH6MuyCk5z4ZgK63eylRprlEjPNkoin9SKsAOkQafLGw3efJ8cPmWxmpPFdy2FsS
         UYTxvQxU6tafXnNK14X3XgIpSMXlEY0FxV5tGGkEldLvmQ+C2ACfCaA1Fx2FdK7bEs6f
         cUsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698389841; x=1698994641;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kj3Zu6WMlpxQr17sM16EXcoz5cOx2Zq8aggknXeJGWY=;
        b=MDFleeLqYVyL/WGM3pJjGw6BlKWzRzsZCQeRa5tNld+NavytYjXMJ1nNi9H7vxJG/o
         ioOfMlo4M2VHeHSeFjHYEUtZ8uPNALkQs3wDZPGRXlYcQGyHj7WXTkcjiGsgvcQhrtL1
         0LLvsmd0vgPS4CR7BgwH+HvxcBMhygZ3JqZ1NQde5Ocp93dAxrCsiZ/PcfwRLM1wgHeF
         ZNmEP1eWo9sgQ7eQQT0mCc8OlQJkBOqozcnSqAlMBPNgrNrWQILQwH9h/W7Pg6DmI4p+
         MsJC7Dsnu9EDYNnvnfXUw3jGCe0jycC1oUBqf1w0IHdRL0tSwIC2uGIxjwtGgZDFJxRK
         O6Bw==
X-Gm-Message-State: AOJu0YxI7akVNELDwsFbZGCEkRCyu9Nw53ECvZ4jcAN5NQl1NzBVed9n
	tE1n87M1WG9gzPr3S/TEBhinOg2L4mh1S/FqsqBcqg==
X-Google-Smtp-Source: AGHT+IHq5doa0BQX+kMaVEeO5/zwweZM2r10RQCthE0JiUtVHXqbkVYblKtKbVO/w75KYeXdp21e6Q==
X-Received: by 2002:a17:907:9718:b0:9be:6395:6b0f with SMTP id jg24-20020a170907971800b009be63956b0fmr1436632ejc.29.1698389840852;
        Thu, 26 Oct 2023 23:57:20 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id rp28-20020a170906d97c00b009b296ce13a3sm731381ejb.18.2023.10.26.23.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 23:57:20 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 27 Oct 2023 08:57:18 +0200
Subject: [PATCH] wifi: ath11k: Defer on rproc_get failure
MIME-Version: 1.0
Message-Id: <20231027-ath11k-rproc-defer-v1-1-f6b6a812cd18@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAE1fO2UC/x3MMQqAMAxA0atIZgNNBYteRRxKm2oQVFIRQXp3i
 +Mb/n8hswpnGJsXlG/JcuwV1DYQVr8vjBKrwRrbkbEO/bUSbainHgEjJ1aM1PfODckTdVDDUzn
 J80+nuZQPzjDaZmQAAAA=
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.12.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_235726_753526_A8FB68D5 
X-CRM114-Status: GOOD (  12.02  )
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

If we already have gotten the rproc_handle (meaning the "qcom,rproc"
property is defined in the devicetree), it's a valid state that the
remoteproc module hasn't probed yet so we should defer probing instead
of just failing to probe.

This resolves a race condition when the ath11k driver probes and fails
before the wpss remoteproc driver has probed, like the following:

  [    6.232360] ath11k 17a10040.wifi: failed to get rproc
  [    6.232366] ath11k 17a10040.wifi: failed to get rproc: -22
  [    6.232478] ath11k: probe of 17a10040.wifi failed with error -22
       ...
  [    6.252415] remoteproc remoteproc2: 8a00000.remoteproc is available
  [    6.252776] remoteproc remoteproc2: powering up 8a00000.remoteproc
  [    6.252781] remoteproc remoteproc2: Booting fw image qcom/qcm6490/fairphone5/wpss.mdt, size 7188

So, defer the probe if we hit that so we can retry later once the wpss
remoteproc is available.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 235336ef2a7a..f8f5e653cd03 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -803,8 +803,8 @@ static int ath11k_core_get_rproc(struct ath11k_base *ab)
 
 	prproc = rproc_get_by_phandle(rproc_phandle);
 	if (!prproc) {
-		ath11k_err(ab, "failed to get rproc\n");
-		return -EINVAL;
+		ath11k_dbg(ab, ATH11K_DBG_AHB, "failed to get rproc, deferring\n");
+		return -EPROBE_DEFER;
 	}
 	ab_ahb->tgt_rproc = prproc;
 

---
base-commit: 2ef7141596eed0b4b45ef18b3626f428a6b0a822
change-id: 20231027-ath11k-rproc-defer-d166779fa113

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
