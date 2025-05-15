Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEFAC3ABD8
	for <ath11k@archiver.kernel.org>; Thu, 15 May 2025 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cueXC2hlZsQuDhrii/uQD0jplPg4hNH073llC7Ktm+A=; b=g0v5GuqsMc5PF8/8dVnjfHgZi4
	xOeR+LmUmSns0BbSxyQLJzmevd02azgnY8VFi6a7x1k4avjNhaKkZL74ISSkeheQopfVfj8P5pkFJ
	m3aDvyau1N2aUEqX1NDmSk8IpNmwJRA8MbBP90TEeJgkM9V1xM/a7KHMTv+66umfHDN6p6gwS6wi0
	XZRZ3mbR9ASG8sf9P2noL8VDB8W4etNYCve4CJg9uMxEMyOpOODL5zc85ntzPu36akeQfQZfpVVDs
	e/8ZSFODgnM3LobLEzigtdDC4BRXIz3jFRKuwycjeHLqpzfSIuqVy8m7PbSF+BR0gRNYay3sn92OI
	4v+aG/dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMgo-0000000Gikm-31zS;
	Thu, 15 May 2025 00:43:10 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFMgm-0000000GikQ-0XaB
	for ath11k@lists.infradead.org;
	Thu, 15 May 2025 00:43:09 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-4df4ef9c59dso123111137.0
        for <ath11k@lists.infradead.org>; Wed, 14 May 2025 17:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747269786; x=1747874586; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cueXC2hlZsQuDhrii/uQD0jplPg4hNH073llC7Ktm+A=;
        b=A4wEcPjYhEDRJoIv+gct10jb/0sRN6py+KwtWWTK5eCDppIXw1ZOwz+c19i5VJr2kO
         tWy4N9MLWz4c/OD1xqxFGpxJfUHu0NfASQvvE5jcgucx0mKPy46su1xSKq7PB45tLg8i
         Qym4zggAqXoXXqUgNLvO1b44zcK5eLreqxjw8ISSJESjxDuGTeA4VnTiD7s7HXYKb+U0
         0Y01INzKoinQOFMUKbuRhlu3nOaQ64rF2oHEWQC/jm/V1tWrvIFFaY9uUocTD/Jt2flf
         FI8UV5PSldhu2ViM12oC9uH9yZllAqVDs4jqiryMByTcPyM9Ze0vWZjQslUlavgAgdM/
         P2TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747269786; x=1747874586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cueXC2hlZsQuDhrii/uQD0jplPg4hNH073llC7Ktm+A=;
        b=c3a6EbYHfpdEQp7vJtfcvshviV7lzEZ2bmsqwwSL9Pud88HecMkmZLDeC9qwT2o4EP
         TiZms/90QAHo5hRcq+ozbsLHJ4klVexhTl1uj0dEVvPn2yPLYQJ+TyeQcJkpYNRWLdYC
         XcVBEwzlSICfSTzfHqblLxXJr7txFIYaQe8ndGdYavD5oxyMHW9924z4DsalN8nszhTk
         wIDuLSsUoEi9WQgAbrDKoY/R9GZPcblWG5dV2MY22YCP09YjZmzM8655Zsb1AL9OD/wn
         K+q7/ZJFSKNGvnwndeM4ApKSRCN+iXCmcTgojiN7v9gNOPYQ+zbPAig9CxK2+zNA2kIU
         Ddrg==
X-Forwarded-Encrypted: i=1; AJvYcCXA34mzj1p99pTcfB7O3dckUDlTAj3PmwmPB+x1L6FhC5R+B12Tep23PmTtYpm3rKevZyrfLao=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLusQa5bDmIumEHGqV4aEVocdZaTBub+glRMqDsa7nJqALqn1j
	ezKVZTt2Lnp1NIljBmDd3TDGobmt3scBMGHRiw1Sc6q5bGL27OvM
X-Gm-Gg: ASbGncsFwLuTKF1WQGeLRkhcCsFjZgcZZiilbGztt4a6qdKmKXbAgHe5oAwbGkFNqTA
	AFZcjH5Ltnpfw0L7q7VIl0ILtCRhJCPc0z42xldb7NycIwu7PsSzE+P1ZbfluZMssFr5+QykVey
	rPgVi8O8hISRr7epzbSOE9CfokCZQgJt3zey7XBfcEBHl26+NcPJOL4E7/9dYpQq5oEWr/Y4P6B
	B907wN+jhaiz9vg/lt3R+VJ7SZXeoU91W0j4QvYSdeTCFgbABFrrBznO5UDQ8Xkt7GPe8b6e//E
	moZ+9mXRxzkGdfu4HrooAoyVsZeR6TJ8Qg9+rzGGlgbg+vq3sFW6fjHn1YB/UYtoYR8UIfIWRPE
	=
X-Google-Smtp-Source: AGHT+IGMCVTHaTAAEE9TyxMrC1UkOXyDv9xgn/r9jfFGP1Q8+03YjUg0MM1rRdEdZGDUJNxnohsoQA==
X-Received: by 2002:a05:6102:4b82:b0:4c5:505a:c1f5 with SMTP id ada2fe7eead31-4df7de00c28mr6031983137.24.1747269786465;
        Wed, 14 May 2025 17:43:06 -0700 (PDT)
Received: from localhost.localdomain ([2804:14d:4c64:81ec:7409:107a:a63b:a3da])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-879f603551dsm9775065241.0.2025.05.14.17.43.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 17:43:06 -0700 (PDT)
From: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
To: jjohnson@kernel.org
Cc: ~lkcamp/patches@lists.sr.ht,
	linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] wifi: ath11k: clean-up during wrong ath11k_crypto_mode
Date: Wed, 14 May 2025 21:40:54 -0300
Message-ID: <20250515004258.87234-1-rodrigo.gobbi.7@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_174308_169729_D9F0D4C2 
X-CRM114-Status: GOOD (  10.20  )
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

if ath11k_crypto_mode is invalid (not ATH11K_CRYPT_MODE_SW/ATH11K_CRYPT_MODE_HW),
ath11k_core_qmi_firmware_ready() will not undo some actions that was previously
started/configured. It's reasonable to undo things during this condition, despite
the value used at ath11k_crypto_mode not being valid in this case.

Signed-off-by: Rodrigo Gobbi <rodrigo.gobbi.7@gmail.com>
---
Smatch got the following error:

drivers/net/wireless/ath/ath11k/core.c:2166 ath11k_core_qmi_firmware_ready() warn: missing unwind goto?

When the ath11k_crypto_mode, which is a module param, is not
ATH11K_CRYPT_MODE_SW/HW, clean-up actions are not triggered. 
Considering the whole ath11k_core_qmi_firmware_ready() function,
during potential errors, those actions are properly triggered. 
I'm suggesting a little change over the default case to clean things up.
Tks and regards.
---
 drivers/net/wireless/ath/ath11k/core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
index 2e9f8a5e61e4..fd3017c444a4 100644
--- a/drivers/net/wireless/ath/ath11k/core.c
+++ b/drivers/net/wireless/ath/ath11k/core.c
@@ -2163,7 +2163,9 @@ int ath11k_core_qmi_firmware_ready(struct ath11k_base *ab)
 		break;
 	default:
 		ath11k_info(ab, "invalid crypto_mode: %d\n", ath11k_crypto_mode);
-		return -EINVAL;
+		ret = -EINVAL;
+		ath11k_dp_free(ab);
+		goto err_firmware_stop;
 	}
 
 	if (ath11k_frame_mode == ATH11K_HW_TXRX_RAW)
-- 
2.49.0


