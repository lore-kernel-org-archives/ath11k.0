Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C153C43334
	for <ath11k@archiver.kernel.org>; Thu, 30 Jun 2022 22:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=05ulcTOAu9d4qnWmDcfXoohooQFpfyH2LN81q1vqS60=; b=ljUYMgIio2evJ1
	/abvZQVgRRFOkptvuITEHAVknw7CjrV5OqB0alv3A3Dbz7NkMvVUjs8u18jVvczJXqdvkaZ0+7cuO
	0Xn6wiLY+zl+6QTzvxJ7diZc8w02ujlKgZCXsbu8dfH8FTBOsKtcBeo2Kpl98NTAtU16ux2og2Ynl
	SOzygthN/C3DU0fwuv8N2cgjhJ8dMVAZCxg+TG3u/p46xet66lzyR02Qv3TT1G6jyTXdcZ7isE3zo
	HuJrwtiC9SZxAfk7lRjrFlQoVAuAftsIpf1Zxjrp7wczIwm6oWzQXqo/xEEiIP9gm8QnFNJcqmg8+
	UMdTfuVJA/2IIcwnk45A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72NG-001mGl-OC; Thu, 30 Jun 2022 22:10:58 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o72NE-001mEm-BW
	for ath11k@lists.infradead.org; Thu, 30 Jun 2022 22:10:57 +0000
Received: by mail-ed1-x529.google.com with SMTP id c13so635667eds.10
        for <ath11k@lists.infradead.org>; Thu, 30 Jun 2022 15:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:subject:mime-version:content-disposition;
        bh=uuBSBSCPKgOQ7PAlwrynPxegtvznuCgMeTVAh47vjw4=;
        b=YApFkoORz2xvc90JTkZuU7GxOBq16iGFU2lGdTH83EJlyEv2SCe245AhOwgRV9dF2O
         2YZAAzTQRXDAoOT7jLDNotNO8ECAcA9x4p620EgGWQJPoAw0lL9LeoQGyclEJVYQYQ8h
         VWi2I/guuT9/BWPeWPCgah7sWNhiMTMyPAZuH+5AomEU+ffidBBYi2U8PMSnu82OTW0p
         BJ/4tD71BvpUhFvAoNqyppCWobuWkNIkpcJjAS1ruaI/HrveQO+2rnaE3Ye2K3p+k5Qk
         e/frSjBlwiCTnMwq9qe7pTlSJ+kcFfq8iyrVuOIDfg5QuIR1RF++qi4lavZQm4QwjUr6
         LIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:subject:mime-version
         :content-disposition;
        bh=uuBSBSCPKgOQ7PAlwrynPxegtvznuCgMeTVAh47vjw4=;
        b=FpaqpPO8loR0d7HaefxXr7mr05Yi6e6/9VZuWj/t63wHXthPyKH1iOTwik5T1FLIsW
         cejLDAnUkAz/+fLDNM/GSloTTorCy6wxMe9033svjMckr1F+lGtZg5/YTsJECwtu6NPK
         lL8EeL03WU7TuMEWAUpc+14R+YkqPhO96UdA/7RvdwXU6guS55KDwRUlp110JPGVwFqG
         FO0FQm4WSmGwLf51TrgmZSwPUWCkE+Jr40po8La+/oGfHpYhPUTtEXSmApCSvBo51cqI
         34A8+6RwCW/rn3vHx7WN6I0HR/6zDfVPhlx+znZ0K8uz0i5mk/gh3aLdQI+echIJ7OvI
         ivlA==
X-Gm-Message-State: AJIora9XmOKvEuMm3Q/ycp7JVK/N2DjnoiB5ibWTi7b1y15YpUsx1qPd
	Hmf3M+cvjCGVXJE/lDq/ozDpA9Pt9Uk=
X-Google-Smtp-Source: AGRyM1sqj4iopVuevOBvEGToyjdToLHw4T5tQYgZp9b20jwLYvK2m2mQflgR5m+yO8LDfXpRWBDvWA==
X-Received: by 2002:a05:6402:1d48:b0:437:5708:d6fc with SMTP id dz8-20020a0564021d4800b004375708d6fcmr14062886edb.409.1656627054013;
        Thu, 30 Jun 2022 15:10:54 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id p23-20020a1709061b5700b0070e3f58ed5csm9570257ejg.48.2022.06.30.15.10.53
        for <ath11k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 15:10:53 -0700 (PDT)
Message-ID: <62be1f6d.1c69fb81.647ef.1d86@mx.google.com>
X-Google-Original-Message-ID: <Yr4fbTCk4YSicmsi@Ansuel-xps.>
Date: Fri, 1 Jul 2022 00:10:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: ath11k@lists.infradead.org
Subject: IPQ8074 firmware crash with testing version 2.7.0.1-01701
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220630_151056_436951_7F04E438 
X-CRM114-Status: UNSURE (   5.08  )
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

Hi,
testing this latest firmware on my ipq8074 based router result in a
firmware crash. The firmware seems to crash on loading.

The router is a Xiaomi Ax3600
Firmware: WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1

This is the crashlog
[   17.277607] qcom-q6v5-wcss-pil cd00000.q6v5_wcss: fatal error received:
[   17.277607] QC Image Version: QC_IMAGE_VERSION_STRING=WLAN.HK.2.7.0.1-01701-QCAHKSWPL_SILICONZ-1
[   17.277607] Image Variant : IMAGE_VARIANT_STRING=8074.wlanfw.eval_v2Q
[   17.277607]
[   17.277607]     :Excep  :0 Exception detectedparam0 :zero, param1 :zero, param2 :zero.
[   17.277607] Thread ID      : 0x00000069  Thread name    : WLAN RT0  Process ID     : 0
[   17.277607] Register:
[   17.277607] SP : 0x4bfacdc0
[   17.277607] FP : 0x4bfacdd8
[   17.277607] PC : 0x4b18d338
[   17.277607] SSR : 0x00000001
[   17.277607] BADVA : 0x0028d127
[   17.277607] LR : 0x4b18d2b8
[   17.277607]
[   17.277607] Stack Dump
[   17.277607] from : 0x4bfacdc0
[   17.277607] to   : 0x4bfad400
[   17.277607]
[   17.324231] remoteproc remoteproc0: crash detected in cd00000.q6v5_wcss: type fatal error
[   17.346841] remoteproc remoteproc0: handling crash #1 in cd00000.q6v5_wcss
[   17.354631] remoteproc remoteproc0: recovering cd00000.q6v5_wcss
[   17.387472] remoteproc remoteproc0: stopped remote processor cd00000.q6v5_wcss

Firmware WLAN.HK.2.5.0.1-01208-QCAHKSWPL_SILICONZ-1 works correctly so
this is clrearly a regression.

I know that the crashlog is probably uselss so feel free to tell me how
to provide additional data.

-- 
	Ansuel

-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
