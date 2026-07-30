Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FFBC54FD2
	for <ath11k@archiver.kernel.org>; Thu, 30 Jul 2026 03:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=; b=0FhhB9huLvcc2SRUUN8as8NAz2
	1Z6K3IuWl1fWktERuBdlwJC/MZCR/m52j17AAqYHtuAxFBNKPQ1O8GuMBiluuuEvd8hwlBmUEAPaz
	dwD6AX/0bNYItY4iZXXx7knK6e/hiXD7uukGJHDOwTSnx85ktUgKOOmouM56nCK74fyslaqH0ikjy
	Ct8BT77YyaBIVGBPRLHK2dvnW8HCDKLcDvX5SXujwJ8JQ6RP2yhEnJ/5UIpiCJ5Bili2T5/kmakt+
	mNoZ8Tr5lUBS0e6vspRB4m38nM38g27AYfzXb8cJyVGHHSgTnzlPD9mU4Vitygffd7akvzb1KqS8A
	LykUsbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAN-00000009ORy-0oY9;
	Thu, 30 Jul 2026 03:10:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpHAK-00000009OQ6-1DPO
	for ath11k@lists.infradead.org;
	Thu, 30 Jul 2026 03:10:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U38uFQ3902026
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Hru35mpumEb
	kOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=; b=inlykNPbeu+ZWHbKW044qJZOKAr
	Vr0079Tvp4dzhVqybX9B0C18YX7Ek6O8U07W6nW29ia9IbpKNNtGUWCMffUHVbPE
	8fmKEwkcMaE18s6hamKc51Z5TBzyqCtqIOPrvF2+7RORnAzqs1ggDBF0l4/i/z1j
	NFZhs6pInncsnfIDld5CqOtapAdtbkDA+BN5Y20U8YmdTXryD23eX62oNqFE/Rvu
	kupg5SEA1wAtACLn5bmfoh9M/RoDm37QT9DzGiWZaZJjnLJU6sy+cG1K8FgGgQ2d
	RCUSoSco/4vbu8qpFYY8ddBMM+auhWNe5xGBiKkzyJj+hcwAHaKdx5WgDHA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqxf1806v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 30 Jul 2026 03:10:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6823efcso14731145ad.0
        for <ath11k@lists.infradead.org>; Wed, 29 Jul 2026 20:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785381034; x=1785985834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=;
        b=Rp/KTXirlG4XqwsMdKQ1M0isCHla369rj3E2l53JHswHBzpCLjravuakdjHm6YdRK0
         9CnmJs0UqTADWg/z7ZMMT+T2dVFFMF4Dr+uNqXZ5Z6mJD+x7z/ZxUss5bgQ8bnDPrZn1
         lSudokfeQwvRWLCbestxFkXYdwJGXtM1zsdZCsnYgZ6YGERPxkdBzX1ZNVA1WIO7PRiF
         wYeSkUeGJzelyzqjBQjUUsvSsoxThDChdShyTbtfLMihG1JeZjiZRfVx8c01l4QwC4At
         oFK81q2I2191lEeOBlykmoYNc5Q29/HSNRinxLvC8VMnIHudk3xq02cDvo4x/SdJRi07
         3w9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381034; x=1785985834;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hru35mpumEbkOLf7h02q3Nl02jlJ/9pefcv0jtM38wk=;
        b=S/w+oqHqKqIIZVG3GD5L/qJzQHHJiJJ/jG4BAFtp620su7QoZVahYywVi4Em8qTmNd
         szV87xhuvFdnwx6oqa5lbeDGb0YrWao+BChy6kn++sUp/XNQrPGt5dXGAilnz9ZhzQIL
         o3/O5PYYest807KdJ1XTc8DCeguTzdXG/9xvG0I9AykQ8PSabgFVlTsrN0CuWtCEaRbp
         DwkMxzrl8+8FQ+QixTsNTBf8Y+/559uYWk0010jpIsWW2i+v+S36eRSHL01vUQGd2CvJ
         XkzTrOa6/WeVSE4CrMnd60siDjA28RvkAKxu7eoawTJ/LmD1XTcjQiZTL1qWN0Dx72Z+
         Uu8w==
X-Gm-Message-State: AOJu0Yw0lyRArDakpoU6KLRYvqO3ogOYS7tNDhB5lbREgUOOwD6Ksk7+
	XdTe4Xjc1NETuxSc6Eh/hVAr/k9aMfaJ8BJlPDBfErEQPisfa0cwa1k+kyffhg1LbdtEAAdTnBT
	VPP2xU2LEP7sbGYMQiZsVPaiW9Uv4oPL8vB3qWiZF9au3n8d9ahFAjbLCGdETX1eMqxcmZalap1
	s=
X-Gm-Gg: AR+sD12mNTN9EXl1aE2GJoDkrNEDViwZjJWLi9AzMUnIj4/xe1dDMcqg3ZA/A2qgWnQ
	fzi4bVMoSMfcVQofWO+DiVKw0pXFggZrE2hFt9wkkbgzYhfmGkySPKFbD4hYMxNCUyr5G0iRPo3
	o1ftJlQTZPSTUSvAmXuIFyTt9pt9qgDkQkifHRhc5tBYHvmae+a50jNbJ/qdAlP7ZX3DlGxJ1YI
	AIw9cvPQ5Dd+qc8OnS0VfRM/Y6dXcyM73D+OahLrgQZ5U+T85sXPlNJQ7OlvTQlKaQdtoYCHEde
	/HgHiMkx25bbhu6RhoJtsYch+XHI8wS1htbU3Odqmk33yJ3bB1lTWZTQ9aHTdPiZ7Rx4YAGCWt1
	qSSAlwlg/vCHDy3dusYpMZgP3fOKhypWvAkLCLo0vX9HOCJtYpNWtBMXNT3I=
X-Received: by 2002:a17:903:f8d:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2d035e66a85mr9174795ad.38.1785381034446;
        Wed, 29 Jul 2026 20:10:34 -0700 (PDT)
X-Received: by 2002:a17:903:f8d:b0:2ca:c68:c554 with SMTP id d9443c01a7336-2d035e66a85mr9174545ad.38.1785381034046;
        Wed, 29 Jul 2026 20:10:34 -0700 (PDT)
Received: from Z2-SFF-G9-MQ.ap.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022c2e5b2sm18928035ad.74.2026.07.29.20.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 20:10:33 -0700 (PDT)
From: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
To: jjohnson@kernel.org
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Subject: [RESEND PATCH ath-current 3/3] wifi: ath11k: unregister PM notifier on QMI init failure path
Date: Thu, 30 Jul 2026 11:09:48 +0800
Message-Id: <20260730030948.147892-4-miaoqing.pan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
References: <20260730030948.147892-1-miaoqing.pan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DVhYNRu08mNwx1b1rv6rFSLL-EZgFVwc
X-Proofpoint-ORIG-GUID: DVhYNRu08mNwx1b1rv6rFSLL-EZgFVwc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX3bSWlGQxesFJ
 /tjPXE1glLCx4b5GldMknnKqCooMyP15fwtWtEqulsMwhJATP7fAu5yQ7JiF7EcHp4eiI4WmvM9
 sJwvEYhyEVRq2X6R+MhI1x6ZR1l97qxSDCZXXY2Ua4ZPfoLL3FuCdkuXIf/0eacqw2cKdARJgLx
 oJYP0mQTqOAnaBZPmFFA8Rt9PipEEyZ7w7CNsQ0Xg2xvYgyhxj/ptxt3yplG37Jj9yecnQudtQV
 Oxl9mjNmylTb2p5avc9M33zqTrRDXFOJGPl5lQvQOmI6WPDWMgnewrXX7YtEiqp3IzR7DJqIvjL
 zvlZ6mlk28AZSAy0xZdau2PIgo/eEdZoStvjp1+sB5wixhSoyWQRsXd3L5C7+97xdyb3hpZeXC/
 GXNwDMrEYwEuCaMFb5hmH+ZeB/0ZcKbCWBF5e4cP7lOkI783drHbQxefuNnM890PyYN0hFCbcBl
 Fh7PWWNC5xqIm+kE9iA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAxOCBTYWx0ZWRfX9/1w2miaV9pu
 cGf3eM5tDiQmjco/jvOAkWmkfOem4RCKU5qhUgBCSBDc/Ou51ze2zm/zO0tSTY3Ad3uM9k47j4D
 yGxhFi2V+UT55NVxGbPQQBib2YimUY4=
X-Authority-Analysis: v=2.4 cv=MZNcfZ/f c=1 sm=1 tr=0 ts=6a6ac0ab cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=FJAr2BPrIL5JYYbaf3kA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_09,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_201036_446854_A12813FC 
X-CRM114-Status: GOOD (  11.83  )
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

ath11k_core_init() registers a PM notifier before the QMI server
becomes available. If the QMI server never arrives, the device remove()
path can take the early-exit path introduced for QMI initialization
failures, skipping ath11k_core_deinit().

As a result, the PM notifier remains registered after the ath11k base
object has been freed. A subsequent suspend or resume event may invoke
the stale notifier and trigger a use-after-free.

Fix this by explicitly unregistering the PM notifier in the QMI failure
cleanup path before releasing ath11k resources.

Tested-on: WCN6750 hw1.0 AHB WLAN.MSL.2.0.c2-00204-QCAMSLSWPLZ-1

Fixes: 32d93b51bc7e ("wifi: ath11k: choose default PM policy for hibernation")
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath11k/ahb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath11k/ahb.c b/drivers/net/wireless/ath/ath11k/ahb.c
index 7f5f5c8d7c56..bdb8c99f10fa 100644
--- a/drivers/net/wireless/ath/ath11k/ahb.c
+++ b/drivers/net/wireless/ath/ath11k/ahb.c
@@ -1272,6 +1272,7 @@ static void ath11k_ahb_remove(struct platform_device *pdev)
 		ath11k_ahb_power_down(ab, false);
 		ath11k_debugfs_soc_destroy(ab);
 		ath11k_qmi_deinit_service(ab);
+		ath11k_core_pm_notifier_unregister(ab);
 		goto qmi_fail;
 	}
 
-- 
2.34.1


