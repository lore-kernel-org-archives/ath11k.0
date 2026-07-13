Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3453EC44507
	for <ath11k@archiver.kernel.org>; Mon, 13 Jul 2026 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=; b=M4RUT+kCM66HFB
	qRtS4nwTZY23OmB2RlRx8z3+UA0BjV6XjYeRGnklevGFilfDUZ3vDWBH4PI423zApJwIzUA43O5Yv
	RLiYtaok1IX+JnCMu3E38un844eu8oGTFpukGJMr0lEn19mdf8guluiO2WwukW+0faXcEcHZeT/pI
	Anw23Pe6Q+qLRboOaWbNigevXvEaCyod03bG8WrPYPCUHNEVIFHw+/EJfLvLXjCPJHrpqs/mUo4Z+
	rOEF4btJsuzmyXtzAHtdzyWpuiXV/zgsJCu2eczF4GXwIAmOF2+kSp2Hl5f57Jp33swCCBI1fpDkN
	d/RWmkmabSzNkNYqPWRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJK0-00000009vTs-1yCx;
	Mon, 13 Jul 2026 16:15:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjJJy-00000009vSo-1Z5p
	for ath11k@lists.infradead.org;
	Mon, 13 Jul 2026 16:15:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF85DF1887765
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WNGUPRa2nMu1ajQvnmZN5w
	+JKhB37vaeHCrbmFos2tg=; b=WtnFqytGP7MsMjXWUKUdaI1dLvE5vcwATVWfA5
	fuPvGC0CIYZPllH8FEqpjD49pktUIxllKTzY+yenThgbpIGFw2JdAoDyesYO6+Oo
	nKiv3J1NSK9IaHuQkNn2HqeO2Pls+4QEj3nzivXsA3TdGmd1LsbR3Ds2aR9VgR2e
	DWYMmtkU7arhs3cdV7opIGxEsQsGVQg8+CErGgtsfbDbS6OozauMLW639samUN6Z
	wII9M8wvIaJxyAn01SUHgh2FyDs3MIGfjcCbqdHUQgzpJX23+rrNP+HNmJdGhEoX
	EXi9MGDXiAJda+c6WJw8n0FJo9dktppqEm3U/Q76nGylGRGg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwavsnsx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 16:15:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3810960140eso3515865a91.2
        for <ath11k@lists.infradead.org>; Mon, 13 Jul 2026 09:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783959353; x=1784564153; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=;
        b=PopWCkPsbWDVSN5sHg9HwYwtfRlNIdXk/cYi6haXMsBdpIiEVvSsBTkpGPGWDBLF3K
         5/XrUVr/hPkL4MeSQN251cOyjbYCI8eHm4jiLEmpPqGaYGcR8DTI3ZknIW/n5YMjxPM6
         yOCccQoo38ZrNPEvwJUmI5uaWoS3TE/T7TMvQ9CPYxJQTMReYtYx9fOMrt1wdkpaglmZ
         OGxe3xkBGXTJdW2Mq1T6iZ5or5MKe/bpWkWYBxeXHk4vbFTIgocZsm/aKQVEle3Iq6TR
         XoYA5LjU9XL56auYTplSO5JYC3GtOonWoTbXAE8T5bJPJbId5v941By1UIopU12LFie9
         imKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959353; x=1784564153;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WNGUPRa2nMu1ajQvnmZN5w+JKhB37vaeHCrbmFos2tg=;
        b=SuVp7RB6MCi+2KxIbnReEjuTjWjJtEQnldcX9TBXD9xi9Tlmt1Q3yQ8374GTmyCvUs
         w+YuNEKh4cAEN2k8HAbOqWL+B8Lh/AsMJESeYPRSVNmxA6R8317+j3FFUWcOYTRWaQZV
         l5T3x/37m6MKDSkrBeyiqR9kqOeAhQk75CutA/QvDloEMPNxHdmtoo1pSb67M8WpVO0M
         SXGRFYQMjvu3ROi3eCdxhUZcbR0c61JS/yar0Ey3LObbJQMykYlNOPFO/I6KT3hhGIY8
         aGsVSJzv0j3Z3ReFnkkTKZdcnjFTVxO2tH2UH2gHRE2ao3eVMtIp/gFz9wwd2ZBy2SUV
         gTIw==
X-Forwarded-Encrypted: i=1; AHgh+RrGkmjMU1bPF7yHd5TEnAjo0zyHBWqyRJvs9EwPibObEqw6oGLVxh8q0YcMpxwRmCrWUL1WhSA=@lists.infradead.org
X-Gm-Message-State: AOJu0YznPzTr7WiZNh3CRTNneBs2UMO2tNgkZLepLnpfuZaR5gHE6Won
	wHUnLZhn2M8d0nLPYVC3FrZJTCI/an94wGzuzKbg8AhagmVMdIEDJTj+37XjLYh90dVtGo/mHj3
	XUaQjOjikzz7Qu+Xoj+NdeE8Z0Q6sHCaUcT5bWJ7mCuMGatucImCa10z2h8pxMsUY8MqLSeLx
X-Gm-Gg: AfdE7cmbIBCtFWdZ0z0tkDGQhQSO8ly1bqamBnsgFwyJOE2C38zPCtTGgDthvqLs1SY
	5saJHuVHJ+OSuDPLzxD/d4zNLtBJXoPxutMGJw4393IFykNrDijaYSxej9e+7EzHUZYYE3x4b++
	8scBZQR89LjR2gUf+Jyu/z9yVgoTKro+3FcCFCY7/AM4tRjdiGnMEbvQfJTFZpvc9D+4Da29dw6
	bqr/8I3woe8qFLAGgOOyDRvK+styseiSKUWtIV6bZfkLlm6+2bRH7C34cBV3MxCs8uerL0MvfFf
	HTsxA7jDgnrQel1jXoF4vbacHVoLQKFtYbZFZJ+K075lOYCOiRZVJA+Oo94b2edXpRd0ya4eEig
	6nPNb5eemJLPgJhN8L2A7Ae4s14dR9vN8NQ85Hx0icc1DZhPGfTnYWtT9x12OfuzBQw==
X-Received: by 2002:a17:90b:562e:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-38dc761b1f9mr8969548a91.1.1783959352986;
        Mon, 13 Jul 2026 09:15:52 -0700 (PDT)
X-Received: by 2002:a17:90b:562e:b0:37c:6910:5758 with SMTP id 98e67ed59e1d1-38dc761b1f9mr8969522a91.1.1783959352497;
        Mon, 13 Jul 2026 09:15:52 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3118389d9bcsm60877039eec.20.2026.07.13.09.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:15:51 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID in
 WMI scan request
Date: Mon, 13 Jul 2026 09:15:48 -0700
Message-Id: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADQPVWoC/6XOQQrCMBAF0KtI1qY0EZvoynuIhDSZ2EGbaiZWp
 fTuhq5d6Wbg8+G/mRhBQiC2X00swYiEQyxBrFfMdTaegaMvmclaNrUSktvcCXkxzx4NQfSGnI2
 Gsk3ZuN7z1nreYcymJULPtdKNb712IexY2bwlCPhavCMrUzzCK7NTaTqkPKT38sgolv5HcxS85
 hulGre1WmoLh4Gouj/s1Q19X5WzgKP8C5EFUV61Mriw0aC/IPM8fwAmwidSYAEAAA==
X-Change-ID: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: sqTFUehiXYHsmEX0v8nxMz8SmrPtJCHl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX8Cvibdrln0sw
 Fl4vJuEFRMeGDijTSV4b4mMlDNtzwgBuomwNJlrvrI4DfIC7OycQcE/ULX47JFY5tTsI9LfhcVu
 rJeNwpnTYRGKaFUyBOYkPJvz0pyZ/ZVfzKC8vo1XIOnlH06Fvcaw3y6FR3+l6JzVWPztECBfjXD
 AO+YETLEJjrjGdWTlV1uA7iCAwaQ2lALQrjmUE1YzX0ly+twMiKdH9S7oyiOsrCxFxGyuIdgy/n
 tXEVxD2HbDRuY/8eRiQYE11z1DUrI5zgyMWHP1GQEEpbMwFxFImGUm3AX6GBOHMHrYPAAX2azm4
 fqeWnNTQqdhz9GQraEJRHzITULtHjEwJSPNtB3OYfFxp/mnHUlucjfpwTsa3rcQUXevgQdiRLso
 rMFlzZEl2KayklMDVqYYcXqUIPHqRurDs3urmmLcY5JehCbtLjOKUqnALchApW1J+1WMCrBK1QV
 2kJWPDVrKpDu9r/iZOA==
X-Proofpoint-ORIG-GUID: sqTFUehiXYHsmEX0v8nxMz8SmrPtJCHl
X-Authority-Analysis: v=2.4 cv=dZSwG3Xe c=1 sm=1 tr=0 ts=6a550f39 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4LN_5y7tnHSoj7lUZi0A:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE2OCBTYWx0ZWRfX4v6tLLmdvRfj
 tZfG8j70O7LXOaWu8BnmwJG2Ii5dPOYO1a6EhfjBPQyy0U4ERG52C2yuMNZCLvHSv8Tahbb5pEP
 fttSuu/zbKFeJmGLjO9q7YxxVLc7dc0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130168
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_091554_426977_008811FE 
X-CRM114-Status: UNSURE (   8.54  )
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
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org

Issue was reported in ath12k, but exists in ath11k as well.

---
Jeff Johnson (2):
      wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
      wifi: ath11k: Correctly copy the hint BSSID in WMI scan request

 drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
 drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
change-id: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9


