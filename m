Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC6DCD5BD1
	for <ath11k@archiver.kernel.org>; Mon,  1 Jun 2026 09:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=; b=42Fs2J8BCOB7zIrxowZ/k935IZ
	/wGedCxl9hXWNJTGsqDiEdkPtJs4rNUHmAoUbzJpA/xLQx1RrBziS3zF6AWKgpUrTu5sEOXRf+/wj
	Nre6qQuF/kmWiqqf6xex4wIiYR7ambvhrrrHYUZq85EcQa1RHqlxD80GxTKP2oSPnV07xoz1dv707
	XkPLNfZ/R2gF031mUGe0UasqQxMcKtUgWdRjB4WPVF/BJq07TGnWSfPiQxGgvll3o9wTS7ZMMDq2z
	AIvtYFv2wI3MTmd4ffj/hkaK/zUvSWKnq1TyjGSgN2otVbp9rIkv9C2KNQ6XzRPGVdKCtyGpwJz+U
	viqsWK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEd-0000000AW7K-1pVR;
	Mon, 01 Jun 2026 09:47:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTzEb-0000000AW5u-37Og
	for ath11k@lists.infradead.org;
	Mon, 01 Jun 2026 09:47:02 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6518fO7l145081
	for <ath11k@lists.infradead.org>; Mon, 1 Jun 2026 09:47:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=; b=OSXPRiVhNRnIuaFt
	/jcJLl1uTz1vgCteCW2TVILz4LUaqeb78F/8e1kA+LFt9iOriTBRbvnVPMo7S3WD
	EucL4DJ+Q3UeFkKW0OBUIlJIPZ9WIsiCDRhMeuSmLuBTfj93IxkuO5xC2EBPqqKw
	4QSzBa/wUwoL6osegGrgwbeBuQX3vIJKE41C2qhQ6P1wrP2WABBcCS5A6adZWT+4
	In5J08VCcgwDxJYQdNeccZSkdpg+KLjbbKKsR44xK7KvVylkcefk5x4al/5kYyWc
	ZyGe3+7dCSdQG/rgmyUah/PYPc5DUgBoTWmwa+Mg9EvknrnCQ+Qx4dz0ycQiCicW
	9B396w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eh6str8bm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 09:47:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516ccfa109dso205761531cf.0
        for <ath11k@lists.infradead.org>; Mon, 01 Jun 2026 02:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780307220; x=1780912020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=;
        b=hEvSNRenI2Yufk2ML48wWjmocW421MTDiEgxzqno9h6FAdwW0yt0dZBs7q0R3odtou
         OBxUSMReV5j7V5J0FwnWQCojQ5qpO3DUXqmsw/cRyxB8R+RrL7MI5kD9btZ0ujzTWTkn
         vGhx3dgZu3EdPh0zYvbemMLEVHKCIYVea5mWMVdt6U2S5IvmvEvJu1eK1mxxezbpgQVL
         2hmCDuJoRMyLm7gRjsPE0O3QTmHNkEhz0ib5K+DpQbxRKI07uF0+M/pu1sQfhOLAf7DM
         CX6rH5/oRlV3bpt4HzAKQ1sR7sccJ/6HHFBkSU4LrOJVr8qC3bh0vn8DpzeH0Xg3Xx1Z
         bmxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780307220; x=1780912020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jBqAtuuc8EnhubMic9V4p6HI7fal3LjjEneRXtxWqdw=;
        b=qy78gV7iaIBFBTqbFmAUFidCN9Rpd2mpotkVsILD24idB9uVzuTHMVUoOr1eTW0qZm
         y01ovtMEEt5qvf37NpchsuBZM+V2oBbVLkGEwGOuFbUEEWXCPF9ovD/57t27d+3Z5Kw7
         f4TjHm8Lei9fk++I1v3E7nVU0Rk2hqO9KFv7pdwKhvPo4UWdql2Nf/uo2tAYCzohBGJ3
         kWG4TiykzQF8HM9SFx675gzQerYzw2udK/ykddXurvJK+fOH4Yg1RTJ0MOV9gr8HNn07
         JOpLNur/5VisI38A0PCxDrf+WbcALfUAoNHfI2Jg/mHMqhMGsqQn8rHVwKgGIv8IPYWC
         uJtA==
X-Forwarded-Encrypted: i=1; AFNElJ/Z6BBOx9ZmBXffmIboeiKDAIbHaJ6as5Pv0xu7Rh6YxtE7V1kosgO+n3+MzGSpKOpfzFC46KU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwTD68EbWG6u3F91ML++8lrTfRb8SE5Mafgw2QVPm8sXUvW1trg
	kixGJyk160vPiT+zcWXwagEoZGSiIdySXM0raxkHAtsncmRg3Q6v1ubSloaKg/3RvKfBH9EAyqC
	x6jA/Q4X59b+XLyEYqndcZW7W4uuPI/MR1jjFLLRiNCYkPWQGVS3M0rPOFUAuD/UH
X-Gm-Gg: Acq92OGpFBtZh0VvpGVNLOrU1IoqjpX+Qyik2G39duM/tIeHFIwKIx6UsZrIO/LpPoE
	ehmX+eC3O+Gn0J6rN5yphYoujmnJd1WEk17562gombaPCf+2OAovAWBprbtr2V4IEafrWwmCm8D
	H2qABMo97oIEbRpOdgBthhkg1BOGKKzFmJ78xxmaCpRQex4z2P81xF6nbPJOMb+MLL3+D02c1D4
	x33n5GB6wqds/+zHalX4aHAC4WwTjSd1zYFUI4z7jvYYVYPfB5oh++Y8R/1IrQjK3oMKp3GRFFs
	dKjRKqE3o5Ztj8SG1DBy3+IK5/jNdwZH9xO7r9YtQs4n4cgz7AOhVf86/Kmw4ztdpvxse9eAkGb
	vG00gMs728099yEg+3DBGZyCGG6tZzfddffgWCX01sAGttc3dn2FHVXJrXV9GCW+RlU5lhE+NPw
	FB5Z4k3qzZgAjrDyNhlRj7oOVQofsWWnCGTja+J/04qIEJ5g==
X-Received: by 2002:a05:622a:a887:b0:517:61d5:2f85 with SMTP id d75a77b69052e-51761d53795mr1967861cf.33.1780307220286;
        Mon, 01 Jun 2026 02:47:00 -0700 (PDT)
X-Received: by 2002:a05:622a:a887:b0:517:61d5:2f85 with SMTP id d75a77b69052e-51761d53795mr1967561cf.33.1780307219912;
        Mon, 01 Jun 2026 02:46:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39672802651sm15355201fa.1.2026.06.01.02.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:46:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 01 Jun 2026 12:46:51 +0300
Subject: [PATCH 3/7] regulator: dt-bindings: qcom,qca6390-pmu: document
 WCN6851
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-sm8350-wifi-v1-3-242917d88031@oss.qualcomm.com>
References: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
In-Reply-To: <20260601-sm8350-wifi-v1-0-242917d88031@oss.qualcomm.com>
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
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-bluetooth@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=972;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=i6kjUXsWMMvGZpVkGZgoZuYG86BurQaFVacwcpsLGpY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqHVUKv+ohTcsEMq/gMqjLvJIpmvW0bhyzz1rra
 Zau+IHCLCKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCah1VCgAKCRCLPIo+Aiko
 1bnUB/wLeiJktyGGPY4RKsuvLJcAoQGkQZ2y6YnS6kBfDk+PqAEP4E9tvABS87UPQNzBkz7dswi
 1QqhKybyLK+mnYwrtDDXhsvf2VoRJmi5aB++NIpfdGVEHiXdMxUF5AS1W+rDHHufWgpaGnu7tjC
 2z6jdD19j21jrbDJXNugJ0vqMTREb4DJdU4F6XwHn+fZug/DND9RTLR3Rwdp+Y/b4odBDze3n9z
 N0qozm1xPRUodqPHVrA57id/TE3sI4sVSYd+L+fCoW+Mae04ma3v7GSg9jH4uQviowH1dAZjaaL
 zY+PMnTjXfiKTspjputgXGs/F9wRj0j5XIQxm5Af+X8X8qq3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDA5OCBTYWx0ZWRfX3ItFx0D+MfM8
 3h8tV6A3Iqzo0+iKSL4kN6C+xP6We1lGRhmmx5MYVciFWbRSdW3RWyxbv8PnYyeLutHvUOmA/Un
 DwZpdFnCOGmGricKJ04boy0s4s7qd15nqBCUHqopM43J3OlPwx/3X/8IND+e0Ac+wIlxQza16YL
 BLa6fKLZJmNAwy35ZCF3CmJ/pbCUdnNfE4LBPQNw2xrt32XUlbCb7q9bvgzNFV72ZuT2IKRh4ek
 ypwiDVMT+JI+zuPFiwXnB+C8oY67Tasx1V5i+djU+AmAGM3FvNECgHGMtqyScxBXejmvdIH8Bud
 xdCREgiqpF6hg9V3JO1kqugFb9oeOP8TmavSlpyvBwIOJ75KMPS+yKyx5UgGUyps9d9a5WXgYf/
 OInhBe5efJ57ICvmmUGuFpsfw3yhINx+pyAXnT2iAu7Tr4FVRYBopEiO6Iyccu5sF5S8DVG3iUA
 SzviQnmGYzD2TIuo4ag==
X-Proofpoint-ORIG-GUID: MW4ejvS9CVgx5Wikct9WwKc-i7uui-m_
X-Authority-Analysis: v=2.4 cv=HrNG3UTS c=1 sm=1 tr=0 ts=6a1d5515 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=NEHNw5bNxon9FmZXvbQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: MW4ejvS9CVgx5Wikct9WwKc-i7uui-m_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_024701_792088_C7738B8C 
X-CRM114-Status: GOOD (  10.89  )
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
index 105174df7df2..3d3c6fa7ecbc 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,qca6390-pmu.yaml
@@ -21,6 +21,10 @@ properties:
           - enum:
               - qcom,wcn6755-pmu
           - const: qcom,wcn6750-pmu
+      - items:
+          - enum:
+              - qcom,wcn6851-pmu
+          - const: qcom,wcn6855-pmu
 
       - enum:
           - qcom,qca6390-pmu

-- 
2.47.3


