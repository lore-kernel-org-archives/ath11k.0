Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4231F606A6C7
	for <ath11k@archiver.kernel.org>; Fri, 20 Nov 2026 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TuW42Fsg;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=STZpJybf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=; b=TuW42FsgNWi9BCjes2sBqkT1vK
	0YD995AJheyty0v6Q2njYmasIUfOxdCJiHcqD/DgrdXgdlcJW0DMpJeiy/69uYC+8aisOQAeI4ZlH
	g96IJsI8K699HOheH7//r+EosBikj/rdVO/mUoGMB+6S1x5mA6crDzpyvCKUfvYPAAacrZKN3e/ZD
	tzTcSnseO/fQjIk62OGCdCIEL1y22L/ZK6Cguou7y7CSR/p9DxctkGfLwwNqZdGNAaBvLJyX2prlu
	e2jL59Ii7hwyOC/jkpBH8tzfpPRwT+Xu2RGOih/Ua7rJpG+pwzh4m9MvR7TzpLty8jC5CR66LRaMx
	5rPGp+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUvW-0000000GCcS-21Sn;
	Fri, 20 Nov 2026 20:09:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUvT-0000000GCbX-1yhf
	for ath11k@lists.infradead.org;
	Fri, 20 Nov 2026 20:09:40 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-4ac08f4a0b2so915277f8f.3
        for <ath11k@lists.infradead.org>; Fri, 20 Nov 2026 12:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795205377; x=1795810177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=STZpJybfdiVkZ6luujGOe8arYlEsgB9IFtOqFZbqhuIKirtC5LLGMXmyaWrptHeMke
         5chKUDVpVFzUvpomsWYTZkPA0guv/aVKDI7BBuVrQnx/thh8xWco7/JrSsEjVjdFvghl
         kpbwMYBji6wz1Kg7phipdHXP40RfUstwlZFLVUXwLp4GscaIA5RwPuypBNShoHeQ6GhM
         h+Cz2MbMquwjXTNsMgFnYOzJ0VHEwdSxw6Sshm+ezo1b4ggbcwAN+brZx5kvV0LXAnS1
         BC+ScS3jadGj0nitpM1h6YtStGJ1fifLqklU0dv/amVSSSbKyIsoZfhoot/YiigCpnvN
         Agbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795205377; x=1795810177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vblFSre3MiOJ1U1d0ar++bbAIQ+Yx+HItU4giCjIDQ=;
        b=qj7MVh7R8DKf3klt8BJey+4zJbX8Mw55INlIAzXcfegbPx0INya6LC52UbsDsFYFRE
         vd1+H9w3IFlm/QGAMVtRjK7/jmKVS+zSgBhSEme0dmC1IS9L1oeR+1UF3pFMqP4BXu1H
         ukeRTi1VDLty6eLq+o7s/mu0hMBLh5U2ls/qOuICNQ3QWGvBtRw3KVFLY9k3XO5Xja+M
         iJjpvAEq31+6yD+ISPX3Ul5RbBX6y2PCUTnnOlMrMSDvYse9tpk4oNIew80lcIlvglzP
         jNaXDb/SCTwm8mr2rvc7d5ZnKfBi7ERVBUgwZL+zGzBsjP5T8Fia2DwXKDUdcvsMwZTp
         3wMA==
X-Forwarded-Encrypted: i=1; AL+hErFD/i3G6LMyP8BqNG9AGnLRcx0CzMmmezqjLcUQjyKnFZnmN/8mEADP1PLvebk3SuLobrOEEq0=@lists.infradead.org
X-Gm-Message-State: APuU4Z+X32VsYYZsaNEGW/x785L5Gk9zodBalllO0W4aeWRcOAgJ/Qkk
	DiV89a+g92AwMCgC911UuoLs7ll8ThVpcX7RXsgXKpg6mE5Wn1YirtLao9gIGvCBlIQ=
X-Gm-Gg: AZFdTZcnpJt2ZIbvzH93G6EJispf/up+99BuK2BuXWWnUEE10ERNoilcK+4EZxVe9Pk
	+ibB4be0N6YpyL8PjFWfJ/DiRGKiSV6x8H0/XoB/gQs3+9SjcUC6CzYO6o3gqdplZ1lM9Q5+jtf
	tAowfWIfmiVU5loXmsmAf1Nn8xPEbIX8PFPiCZe8LpdBO0H8gv6eCHoAgSRieavCMdB8+f6cssp
	oZM012OMz9w/PlWcm/T27yNV4VlJe19wy/49RJEyBzS+pXQVwWnG+FWNmmZ3sQrYE9q38SJOfVY
	kTKdWSJOySxUuK3GLRMjN36SCje6nOn0XRkVOWVDhysxVKPR1RYFUg1JBOsF52Si4XVhz9FDfFs
	lrJ3vIOn7RhlePI8e7o89IPSvdP9StMM57m0rj3mzfLBbaqJI60d998uY+rju831r9YJT80v8l5
	C0wjkbIEhlzADm5L3J2zP9Uw17hu3gxR2Gl0JInifd3XEZ5VTJwBBKV7+AQKQCS/D8xst9mrWVc
	to2GTNrZjWn3OiCIGsml+Rzy2pUslNWvB2tFnfNZq0z0Z+QUUFEqOM4I4gBemhnZ65HCRMQVN6/
	J93LHSm7Rk9+IfaruHQ2LLgxVKi6OGP6ikFjX8q5/hMbOuYfd6E=
X-Received: by 2002:a5d:5d03:0:b0:492:cd78:7137 with SMTP id ffacd0b85a97d-4abaa9764d3mr9017536f8f.8.1795205376952;
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
Received: from vivobook-s16.fritz.box ([2a02:908:e843:f280:6cae:291b:a1:8362])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm7869233f8f.33.2026.11.20.12.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 12:09:36 -0800 (PST)
From: "Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Ingo A. Kubbilun" <ingo.kubbilun@gmail.com>
Subject: [PATCH] wifi: ath11k: use the NFA765 firmware on the ASUS Vivobook S16 S3607QA
Date: Fri, 20 Nov 2026 21:09:34 +0100
Message-ID: <20261120200940.81577-1-ingo.kubbilun@gmail.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_120939_525411_9B6D96AD 
X-CRM114-Status: UNSURE (   8.69  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.1 (-)
X-BeenThere: ath11k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath11k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath11k/>
List-Post: <mailto:ath11k@lists.infradead.org>
List-Help: <mailto:ath11k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath11k>,
 <mailto:ath11k-request@lists.infradead.org?subject=subscribe>
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ASUS Vivobook S 16 S3607QA carries a WCN6855 hw2.1 NFA765 module
(Windows board data: bdwlan_wcn685x_2p1_nfa765a_AS_SA_S3607QA.elf).
With the default WCN6855 hw2.1 firmware the target crashes right after
the board data download; the NFA765 build from linux-firmware
(ath11k/WCN6855/hw2.1/nfa765/) works.

Add the machine to the usecase firmware table, replacing the deprecated
firmware-name property in the device tree.

Developed with the help of an AI coding assistant (Anthropic Claude),
which drafted the changes from the Windows ACPI tables, existing device
trees and test logs; reviewed, built and tested on the device by the
submitter.

Signed-off-by: Ingo A. Kubbilun <ingo.kubbilun@gmail.com>
---
 drivers/net/wireless/ath/ath11k/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 766ae27306f4..37e443a18d31 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -1049,6 +1049,7 @@ static const struct __ath11k_core_usecase_firmware_table {
 	const char *compatible;
 	const char *firmware_name;
 } ath11k_core_usecase_firmware_table[] = {
+	{ ATH11K_HW_WCN6855_HW21, "asus,vivobook-s16-s3607qa", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,hamoa-iot-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,lemans-evk", "nfa765"},
 	{ ATH11K_HW_WCN6855_HW21, "qcom,monaco-evk", "nfa765"},

base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
prerequisite-patch-id: ae6c33cce4db2472b5aa360b5e6cbf29763cfd69
prerequisite-patch-id: 85373c0c0ff98ec4cda496c612feffd19f715d52
prerequisite-patch-id: d752bf7c6f8768fa3d4d39387455c3d4551a8481
prerequisite-patch-id: 56220a324770319f2420a2b114db8fd8c0c6b7e9
prerequisite-patch-id: 78692cb7c49dbb17552ec082f147c878aaf38761
-- 
2.47.3


