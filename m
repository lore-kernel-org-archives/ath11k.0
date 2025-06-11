Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 709A3C71141
	for <ath11k@archiver.kernel.org>; Wed, 11 Jun 2025 19:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=; b=gJzeIzYlzGQmERkM7TafxIJ/A8
	sIAHOgXRJ3lptVzJBqM8nyzZ/kUfVgLPahp6CwiJxVDKl2+II2DV+0bGRqj11k+kYe9JzR5rjljmg
	OHuw9Et2Q6iVfTbctYOQceatcbgDe5s5mfS/K4lh7LhOFa4m8LBfhpQazCA7Ksjs3PjshHUIw8/K1
	Hbx2VYogWXLEmA3w/03iCN7yJU5mOYtD+NNoJogoeY1ZVHLwreT+l2dtf8TpEriXPWeyaavdAP3cM
	Ok5LA3L2Rinratb4fOXmgD+CAyhlCTlTU7klAL2nwzBt+whB+Ypiuu++/mcUcYMmS12AwVAqh/AqQ
	+ZgLG6pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRYQ-0000000B4En-0TN4;
	Wed, 11 Jun 2025 19:56:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5U-0000000AZ8k-12pw
	for ath11k@lists.infradead.org;
	Wed, 11 Jun 2025 16:14:05 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEsA019616
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=; b=E+UlaHD+abXN/FqV
	KGu70ycRKjIcsBjDL9u1b9B38gQfKZI23A1mdIIdm7HDI2wckVfqiXQnIR2dPtVO
	K4elVVlWcNt1Mpg0THT2y+fTQGgT1RjDqph4a/QqfjwxLDe97URcD/19lnMG8zjI
	pe1yml7lh0QT842Ubjm3JgmlbyBwTiDdTJj8kVBTdnTGR5FqUmb7CustPBjixSN7
	yeRJi/iMDQiQbD83PQEmpugOl+WA3aGnpqPvEJfyQv0aI1MNJtRrHD617lEC39a+
	0rZbTFvC8qDG4t2gaG4c2xpYjrCDIglRhw62yjhYaU5hZK64MvOj4WYjGB2BRS1c
	DELFsQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqcnkev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 16:14:03 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-74292762324so47958b3a.0
        for <ath11k@lists.infradead.org>; Wed, 11 Jun 2025 09:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749658443; x=1750263243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dxy553rnl4iOCCwPBHilJZl8dv8tb7Ojmt3DJ4lr9Cg=;
        b=k/ZkLkuXXBLxa8xvLl6QN5gNi6EBZXErl7YrYO4PiNN+dn9XgaD0lZ/58osYVz8EW+
         zX9MAn+BgsW/gJ0ZG+Log8w3LWyWvy3XvBu3d/dbmaJZEn1aS2Ikek/b0HJyn+3YuL0S
         LjJeVPwG9hj9iGfoXxQzsOdZz6Jd/gaYonIwAzOVOltlmLlUuwrgpI8idtr7AO8sInxL
         6PvalxNrjQkm1szKPnMqSbHc0g6UfopQoeiFzbzKWwXR8RCP6pho/d2aHFFVcTezw+ua
         Y2Wo8yuCT4F8kEMKQLGZx3ISXKKPRgAtALcrGzIO7ww8SGYX9dfSWUh/VfQ/hyqQfmoO
         lrQA==
X-Forwarded-Encrypted: i=1; AJvYcCW57mVwPhb45uXQ+gjxUw+0S4t4h7t9exOMfWa+p/o7kcQg8fU9hleMk3fn0sYNc95nFjBNBEw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3FIZTUJ0J1RfOdICbHC8sCTZB+ajacYe7J+dxdOjVNbJhzQi
	UR1NUsfiDLk2vVMUGWNw+OwXXCnATh5iCJpwVr2Cz53SFyan6f2hjd3twf32JJme1bkJgvpQL/l
	G3xk77lNhgzvDlT1VUazPsQIiH2vb4cFZSt0rPcFH9gb8d8VA6XL9VNLKctw2XG9b
X-Gm-Gg: ASbGncsUZyzRwnLieMGC+ob7rHwpXaUxCCgwUeAOs/MR8PDNf+C8y3WJcaBgbPRvE4T
	13XoFCbUxI/ZYDq2sJcO7MUDTiD8yQ0oXvruu+S9yqvCfOSnvhRSYKVYZXh4+LnBvLKRM1DtgQP
	PBuqoDzuye8aQuwNRi2c6hFq0lA3s9wvXOCZB0dgwY3vokNJl5XmOeWonD2SzP9ol0PdyxzmHlH
	4/NPRQlT63Yy0n/ML9NH+xvbzkhU58T0oFZ+g5xIGlgdT9qoLAMey82qkZf9ZZMGvS+ci82lUf9
	xYzS/uR0F4TmTnqDWSCK1imFB/TTM13lOdQWaeQnfBX8whFjoaXDbTQRswg=
X-Received: by 2002:a05:6a00:1490:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-7486cb219b7mr5179608b3a.1.1749658442762;
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExcLPif8UAuX4ZoswEaY25R/k69NLePm004lZfTnTJsqF+aqjn9Vn3sVFV0N9NDcXgNtJ3aw==
X-Received: by 2002:a05:6a00:1490:b0:73e:2d7a:8fc0 with SMTP id d2e1a72fcca58-7486cb219b7mr5179579b3a.1.1749658442306;
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482cdf1c41sm9443708b3a.149.2025.06.11.09.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 09:14:02 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 09:13:55 -0700
Subject: [PATCH ath-next 2/5] wifi: ath9k: Add missing include of export.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-ath-unused-export-v1-2-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEzNiBTYWx0ZWRfX8ODkHF/CQ78/
 grP1pIQufBqOjjqktkwng0+0Ps+6letnxw/OPyJmfOtpjeCwEYlGk/u1swmPEXMlfL6prEct2Zc
 n9cCD6s2Ado5jG5OAs3YHJveCCGudqRMVEqWCQo10xsA3kCDAs93IpH/Aylnf9qgcmu77q10jNz
 ffWWqrDcEKX3ZR1xlGobVdoBrFe/Hu8cqiJn8HYtZjdnxuaO+DzSy13QK3yII8v/h+hJKfwlTAd
 4PzruphTbUxQflvM8fcro8f/HfI0vVxW8JNSpb8fdCxdT3V2nZlwMIzSkzbeMkEtua8qZjpjysq
 0x+XxucNrfDJLap3f+wCvX8cXRjcRlqToNDEAfuxUIyuGw7NcQ7fJlSnYH6AoEvbA+0v1HiCGE6
 fXa5gfrjl17SF79tBfQgua3NuHH/cebn30OlVsjPX5ogTDxEZsZd7nMldNUXuVL+RqO7PQGB
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6849ab4b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wX-X5SGVYUOQdF0mMgYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 5HC5Hl7XCV6pPa-6aJHS20anJHNpUwf4
X-Proofpoint-ORIG-GUID: 5HC5Hl7XCV6pPa-6aJHS20anJHNpUwf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_091404_306574_8F4E65D1 
X-CRM114-Status: GOOD (  12.78  )
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

Commit a934a57a42f6 ("scripts/misc-check: check missing #include
<linux/export.h> when W=1") introduced a new check that is producing
the following warnings:

drivers/net/wireless/ath/ath9k/common-beacon.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-debug.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-init.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common-spectral.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/common.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/dynack.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
drivers/net/wireless/ath/ath9k/hw.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing

Add the missing #include to satisfy the check.

Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath9k/common-beacon.c   | 1 +
 drivers/net/wireless/ath/ath9k/common-debug.c    | 1 +
 drivers/net/wireless/ath/ath9k/common-init.c     | 1 +
 drivers/net/wireless/ath/ath9k/common-spectral.c | 1 +
 drivers/net/wireless/ath/ath9k/common.c          | 1 +
 drivers/net/wireless/ath/ath9k/dynack.c          | 1 +
 drivers/net/wireless/ath/ath9k/hw.c              | 1 +
 7 files changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath9k/common-beacon.c b/drivers/net/wireless/ath/ath9k/common-beacon.c
index 01d6d3205a654292397557990ea485b074313341..e4df89f2fa031ad15a40bfb49ea7639b1ab72a74 100644
--- a/drivers/net/wireless/ath/ath9k/common-beacon.c
+++ b/drivers/net/wireless/ath/ath9k/common-beacon.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "common.h"
 
 #define FUDGE 2
diff --git a/drivers/net/wireless/ath/ath9k/common-debug.c b/drivers/net/wireless/ath/ath9k/common-debug.c
index 7aefb79f6bed5b765de27c1e5d46c9f7ad62647a..1ea070200e4a32be34d2af6784f9196aab4e1925 100644
--- a/drivers/net/wireless/ath/ath9k/common-debug.c
+++ b/drivers/net/wireless/ath/ath9k/common-debug.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "common.h"
 
 static ssize_t read_file_modal_eeprom(struct file *file, char __user *user_buf,
diff --git a/drivers/net/wireless/ath/ath9k/common-init.c b/drivers/net/wireless/ath/ath9k/common-init.c
index 7c13a1deb3acf1c1a1430a29a50f79bfb539e121..da102c791712e7f2eaac06d0d91b9ade08faf8f9 100644
--- a/drivers/net/wireless/ath/ath9k/common-init.c
+++ b/drivers/net/wireless/ath/ath9k/common-init.c
@@ -16,6 +16,7 @@
 
 /* We use the hw_value as an index into our private channel structure */
 
+#include <linux/export.h>
 #include "common.h"
 
 #define CHAN2G(_freq, _idx)  { \
diff --git a/drivers/net/wireless/ath/ath9k/common-spectral.c b/drivers/net/wireless/ath/ath9k/common-spectral.c
index 300d178830adf6aeda9bda6db2ef31becce9c917..ca01a07f6630cac3ca69b3fb64c5e51e983e1d81 100644
--- a/drivers/net/wireless/ath/ath9k/common-spectral.c
+++ b/drivers/net/wireless/ath/ath9k/common-spectral.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/relay.h>
 #include <linux/random.h>
 #include "ath9k.h"
diff --git a/drivers/net/wireless/ath/ath9k/common.c b/drivers/net/wireless/ath/ath9k/common.c
index 099f3d45c594d7bbe7c56aad7503627bd37d20d1..ffcf2276eb92e5f6d38eff13adc56c9ccfbba56b 100644
--- a/drivers/net/wireless/ath/ath9k/common.c
+++ b/drivers/net/wireless/ath/ath9k/common.c
@@ -18,6 +18,7 @@
  * Module for common driver code between ath9k and ath9k_htc
  */
 
+#include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 
diff --git a/drivers/net/wireless/ath/ath9k/dynack.c b/drivers/net/wireless/ath/ath9k/dynack.c
index 321ff54fdb4237f32ffa7c3e52f1c2adddc729fc..598b3a2ad818db88337e74a37d68704e2e4dc241 100644
--- a/drivers/net/wireless/ath/ath9k/dynack.c
+++ b/drivers/net/wireless/ath/ath9k/dynack.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include "ath9k.h"
 #include "hw.h"
 #include "dynack.h"
diff --git a/drivers/net/wireless/ath/ath9k/hw.c b/drivers/net/wireless/ath/ath9k/hw.c
index f9a774bd0e13937034989b772af2ab74e4cb3a49..14de62c1a32bd2459cc443028a4410cc2c6e4b5b 100644
--- a/drivers/net/wireless/ath/ath9k/hw.c
+++ b/drivers/net/wireless/ath/ath9k/hw.c
@@ -14,6 +14,7 @@
  * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
  */
 
+#include <linux/export.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/module.h>

-- 
2.42.0


