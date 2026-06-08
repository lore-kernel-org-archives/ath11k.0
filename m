Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC88CD8C9D
	for <ath11k@archiver.kernel.org>; Mon,  8 Jun 2026 06:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=; b=ZTI2xmsVwKG2905uMthdgRdpAR
	yyAhnAPyF3SSAJHf+AJT1mpVd7TPQyJVoZmHFI/DYfhx/6DuCaTNQ0WYBVrcpVhWnfnvUqBaVk4DE
	qI1jDW9gGEjGpMv4KHuqVvTrkeA+DAzAFWSNtALzLY5sj3PtyViOydvjsHZkyTlo1aJHvuV3YoY0p
	ENM/t81d9/QU6nOi/6/Q45N2F0E7Ebqp6LYD1Hypo0+OmpROaWuv1I0jC2Dbvn7LDOqc/h8qQJLPa
	YtDbiqW4JB9YsRaDRLCu5Pt33YwZ3l9wN2NUaMoZgWQojYpMEur/qsPuu45kv9Qn0giW/Em/nKSXe
	ij7a28UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxT-00000002vSn-1Ydr;
	Mon, 08 Jun 2026 06:59:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWTxR-00000002vPw-064Q
	for ath11k@lists.infradead.org;
	Mon, 08 Jun 2026 06:59:38 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PUde2808239
	for <ath11k@lists.infradead.org>; Mon, 8 Jun 2026 06:59:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=; b=hXPSHrH+fhqGRdUP
	q9eHLRWIYHtW6GtbyWMT9hijFc/5KdWgWVN0gomJyJnd8hpMMi59Wha1fmZVst+l
	ETaihHFgl5zaZnM060ze255aWH0hIWC3hLm/vDayGKn1vwuIHuQOswHe+HixmC58
	A/KDzOJRT53cHnrI9j5DGRbY++HcOD9SU4wgrmS57INynG6nyRxZmlrxfl0q1vCr
	zkyh7FhV8cvqsk1ZiZrOFXqToVtL0do9+9cIxKTxOxVhI1hBOnJV+GFVjB1Gjuql
	gIc/gMnk/PEDO9G1z9PoHLF/8UINs1S2dpYV9SjayXbqTktOiPxc601wKbI0PHo1
	T1B+7A==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emb4w6e6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 08 Jun 2026 06:59:35 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6c554284973so4925889137.2
        for <ath11k@lists.infradead.org>; Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780901975; x=1781506775; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=;
        b=IYUERGVthKZRKNUgRicCQB5lSg+sCX/UHTwwxY1iyyAnR0EBaAgkPB5ic8eIrhrFFh
         d0e956mtKaRjpfsauYkPHxnb/QTGezH8XGZyuok4d/QEq7HNVWndKl4+6WpgQuiWoYL7
         s1zIiC9qx2lmrUqJGcoi9EWHuB36ccOxYN94DxDngNd8wnXDRDWemUjObe7TiK+bWtPy
         ez5YSau6hiyOVxsN8xX+lOVbMIi3KTI2FXVnH2FGbEDFSdL0ZgV20/TyPMwuYT8/S2mN
         r/2aRvu01Zk7ko+d+R3Cw3OvBhUWBnLDSviy5tewC2x8AzdrNwfSWLGCELTQdMvwcJEt
         9e0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780901975; x=1781506775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AedYKycSBAq/raV/KihAPiAmgc3F5eLdRbQLIE6J3R4=;
        b=A++3bTcyzj9ay3LCJFGPGilZyKeEY8KgqpuCoYmSvW59Y9a0kxZrPrgDEqh/43pbJz
         MbJEJYztiiyYTsISt42z78C4K8Q+oChz3xbIpjmcGnUDoIQYKECijpD+A9f/XJY7t9YP
         XNm/bl1n26cNYR5s2wgXLCmN6I/jHnh+UfAghVhpJ2C/lv/SAR3SI5lsjzBx07qdsxTN
         23TEPvW+9Hn2oF52Qtfb0PGpCLknk8N9CTpU11l28ewgXF1jqVnpeFiu2xiU0F8q2RuD
         2z5tAvnOJk2lEH9+rrnavzFBk+hgNGBGYYCKntEkX83Psj22Gp2nj5MB9VFlpKo+WAwR
         EzYw==
X-Forwarded-Encrypted: i=1; AFNElJ/vKQ0/ASHu82zExsZ1iABAVtcyyqE/W4ekkP1nfo+VOlYqhi8jOGPbtK9dD5mWJHhiGFOSj4s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBujhkyHcol1LU4COVGc4OOAWNA+opJnUwztFfY5chRAFmSUFo
	MBwbTE1LP5WMKc+2T5kKmIlWryKnpVX2jzakT9jLbt3L7ryDmgGePJetNDrBE6Es14Liu1GT/ky
	dgYTr+RWu+xSJl6+lO4AkUYaMo0vOe3AhZmBUyZAQOTif3rl24Mb5XNW2NtpTvlPo
X-Gm-Gg: Acq92OGe/NVHrtHgNJnmOpewxHaRRXr7DE8oe2iGa4A6DxqRxEoUduP91NvEKkxMrM3
	8SD6qt3wMV95YiP2hdXgufurKfleWgJ8xB8+X48TqPGIE2bIanD9p+lXWS3wiImr9xjEYGoVVhu
	QkvbWkoHiRZOsfrxNc0MMaF+Ne+ELLaNaM9G2Jdy3h8VAA9v35BWxoyn5UvK858A818q6GRHiy+
	iAjPBqi7aduN5k21gHb4OX2kizfHRqgWV12kxuMNQC9CMFwuKHj9buOcwe8jHOBW0HT3M8+5ERW
	Na2f93vz6RAs3XhH8BVXb16km2WbuWlnJfkLRNDMHHVzXhpM5lmFHeb8D7PvHllg7SPkcC/ktY6
	9ClPe8FN680S2S06VZA9BZFXEtrZwqikwjRehPRVqfAcgMeJQf50oGd7a5f/KVjRKpEKrwACC3D
	EGBdUyoA6IWXle5ORGCnChoshT2UXImX/4Ai5FfJ/ULyQ8nA==
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr7047270137.5.1780901975203;
        Sun, 07 Jun 2026 23:59:35 -0700 (PDT)
X-Received: by 2002:a05:6102:80a0:b0:631:ec2d:12bd with SMTP id ada2fe7eead31-6fefc010482mr7047241137.5.1780901974810;
        Sun, 07 Jun 2026 23:59:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed789sm3638621e87.3.2026.06.07.23.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 23:59:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 08 Jun 2026 09:59:22 +0300
Subject: [PATCH v2 4/7] dt-bindings: bluetooth: qcom,wcn6855-bt: document
 WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-sm8350-wifi-v2-4-efb68f1ff04c@oss.qualcomm.com>
References: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
In-Reply-To: <20260608-sm8350-wifi-v2-0-efb68f1ff04c@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1085;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N4lXB4opQ7qAKuk8u1f2aSIoAAZnDbqfns47nokZNK4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqJmhLefQFtHVh2ZE5dkKFHBcXKIIkVHYL9/M6m
 O8ttgGrP9+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaiZoSwAKCRCLPIo+Aiko
 1U4QB/9K3hMSohuH95r/Oa9z5CleEUZa9trHYMzkZSs4atX3e3oJ+ChcjsV2CqnONdGXXsumJoi
 r0dU0wohcdC9sUpfzUgOjDFrCiebbeD5sDDwz37woVSxK3w+FHzup43hPyuYbtHt5bGWSmvAV5A
 yO0N73dtOYKgobqSW2Jp6OzyCgM30hqO/5lcAhgNfQFkkzzMDa18gytiVJjFgy6/MhVDLFP1Tvi
 ZzcuGwZcXa/rf7tt/cwD/9BKHe94vCVjZXGvT2F4qSHAgtYl9n3SmCHUcsV6O9MHyvF0Yzto/+L
 wIzPN12ka8f5jj5HbdGkiHXX+SiSNQC+C+JTg8GyMJ3YsVhl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: zuiTkL-gNuA4S5nbsyslOlDaIOJ-NdFT
X-Proofpoint-GUID: zuiTkL-gNuA4S5nbsyslOlDaIOJ-NdFT
X-Authority-Analysis: v=2.4 cv=YIWvDxGx c=1 sm=1 tr=0 ts=6a266857 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dvh2RpXz9-UaKh2pYLIA:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2MiBTYWx0ZWRfXzlEtHZHWfyGm
 YqKRxM4lUixfYDJcu+AL8DN++9luKsMT2+c7AdlJwt6rUjjtJPdV5+OgUYlGXw6v1VBlMYzvyuA
 PN3DqdGqPNkUdzffjEDqLB7ddRkKVTz/6rvF7tq3O2xpKoAw7e9fazn5FFArcrTq/NBYuQflMCi
 aeEd2E8qrjpT0QDu3KAqrNfF7dydrPdelAUO4TUkq0Ay3XIg8RYLEp5oyU94h8pBAbl3fMhmVC7
 TAVICS3KIURH7dZEY3hxRkUkKMxLAYHuBl+CKHNR04CrEde06koD9EO6khiP7FhQy49vMHKjOTi
 quXfxzVQ8hkd6+8AZ1Y7vU2d2M3n+K6yuUoVX/IiU6FuISP9SUs3fP9vLIbPePJWFFAwg5VQOhF
 tFlGaWc5KeVp587IFP9W+p7eJBUHXaAyMnZvf1yBZuf+OZchDv2l4TklRaXHSPnAeZzPnu5H2Af
 v53vnY3DUhNUErbqwHQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_235937_187914_1CF63C5D 
X-CRM114-Status: GOOD (  12.00  )
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

WCN6851 is an earlier version of WCN6855 WiFi/BT chip, compatible with
it. Add a device-specific compat string with the fallback to WCN6855
one.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml        | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
index 0beda26ae8bb..ec766f40a042 100644
--- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
@@ -13,8 +13,12 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - qcom,wcn6855-bt
+    oneOf:
+      - items:
+          - const: qcom,wcn6851-bt
+          - const: qcom,wcn6855-bt
+      - enum:
+          - qcom,wcn6855-bt
 
   enable-gpios:
     maxItems: 1

-- 
2.47.3


