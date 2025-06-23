Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52CB5C7EE2A
	for <ath11k@archiver.kernel.org>; Mon, 23 Jun 2025 18:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=Gfx6GYvbKiCsyTKvV/vCk4+Xo6
	x6eD9X2yqowQzt1OBBTnRQiQdDw2zSWhU+lBCyyZozx+rokhdVSGUmNSu0r5+fUOG0mqtqyA1jW5Y
	e6hR4y7aewmjYt9GFlK82wYnVGT7OcAHpssah2a8uTDONnlyCNfwnoThcBTr2SZUgJiM1XHTgYiuk
	jYqAbK0xSl6izB6fN+t59/4PlJtoFjlTZCSt4B4LKyicDx78KikybZp3a5Jb6MeB3WZRvug2Q98dL
	icz/lfrIzarRkm1/Tls+aH766Ep0ZIMLlD9UpQYA0PjVNADHjM7QdLrtO2rXopR1DdkzYRUb+n3KJ
	AhWvOdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTlzk-00000003hHt-1WRd;
	Mon, 23 Jun 2025 18:34:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiTZ-000000036yg-3A1k
	for ath11k@lists.infradead.org;
	Mon, 23 Jun 2025 14:48:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NEjlDr024604
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=; b=NDOmiEujLEJlm+jV
	nPQLPkIh2FFlXdgYivocvH5oIbD50XVwpmwavq/6jNOo3EmMC8q2/b7JSLWRwTDo
	eoe7KIhtAiJpxRSjAnMB4mfYXXhGvHJAKoDZFpwbw2svzW7MZy6pqWFXejVClcV6
	y843WQdQ6K9ivDvbOpYjoGr4gyle3RRpDA2omBTNHnuGW8/owF328R5N2zuaYUY5
	Glv0hPPwJWb2QrskxcsV8SxqhY+94+EzKbbKtCXzIAzfKLAKRPPPx3UPccc6M0i0
	vFF3ILiP1YQaJ1kM9CQRCIUmCS81GS/gJKCiOiyXpQOz3dakDNfc+tBz8HXtic5Q
	1PMJbg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f8ymr06q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 14:48:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b0f807421c9so2818950a12.0
        for <ath11k@lists.infradead.org>; Mon, 23 Jun 2025 07:48:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750690128; x=1751294928;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bZTvShEFC4b3+8jhq/pLhvEl1j+I4GJln1yh/jFqMd8=;
        b=Kf7+CabPq3IXDxkJQnxqcYEB9ttvgb3gqI0LZXq+qBmSJ8UldkMoFioQFpV+mSBB5n
         +2EzQDaJ65KmRro6J69d5I6Y7dKNDz9PBRJpCBDpLfKLA9jHfIjwnPL8/td/uni548aS
         ohFgUWKuAXC6oinRMYWUARCdniWxikVbOshXAhCe3tVe2YvKvR3u44X4Oo2y+WwAFCV1
         0mJlPfl9z5yd90BBs+joc6EdRHcEXn3pgprWInZY0lpbuQD3zCNR++NgEsdbG3PUKNCa
         CqYtPN6AIroPLotI49UlZrK+apiBh2z9XFm6omdiuZ2a17ova4W6r63xiZCrUB6ktF0I
         +DMA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ5wDbpTRDqe/satqdFa5/P0p8a0dUR2YQ0D4LymZ5TyyPxK+btxlzF/8txpZB72pOFJzRS6A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz5SdloUPzVMe48Yrr33vBWd/jKx0PhHW+Cs17q3PAbl2W6ngk
	bRemVTwmaMZGXkorLRBaYB2SkG3dAx3NGQIauw3F9Tn3KSWkSnbj9yb1ukoo6urUCtXwCxk/YaO
	1RoyS7C1ZR6rrWGroUZNmILQUlfkcIXxUl4Ii5/8nRA7LHsGsoF3tiT8FslqjXHf4plO4fdvg
X-Gm-Gg: ASbGncuZ9JU9gtY1ThcsmzZUtKpDDTY/hI/ZI2g/TOWUXgoMxe2AzJ1DvKHJQRYh6ZV
	fEcP5TgfTgFNz8cyWJ/JoxOTsU9KYz6jejQ6LJuSrA0W/CW86cdpgRgd/NcHVe1F6axryafz992
	xehhNRXiQT6L37dYVMSouTCgGdLrgOYIbl26IS3X25xXz+YknLz0uMgDgtKLL1jwV+2DUfXI22V
	VBrHQ2UQiei09c1pC52guzpQKk9KNZvwrfXPlU3QW7/BraP4d8ab5FxJziYhTLLjOLrZoWhB+KG
	7iZOJGCXPwdSk1RFMhINwMTGy/p+okvqBk1zi6gloBTD6N3/ME7rNAZZmQE=
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602347637.25.1750690128252;
        Mon, 23 Jun 2025 07:48:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhT/7HTLqOoGddSf9WDDsTxORjqJ/SfHm0+ETtMJ1rsYsqMcKPrqpqZxFiopZf4JOj4k/SA==
X-Received: by 2002:a05:6a20:728a:b0:21f:74b5:e8cf with SMTP id adf61e73a8af0-22026e47ac5mr20602309637.25.1750690127859;
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a6d1eccsm8332894b3a.180.2025.06.23.07.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:48:47 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
In-Reply-To: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/5] wifi: ath: Add missing includes of
 export.h
Message-Id: <175069012683.3758471.9698383719451711198.b4-ty@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 07:48:46 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4OCBTYWx0ZWRfXwhQA4aAK3/Eo
 7lxUo0G9sQoqG9okeKejaoz098KajTaM+ClPIuMWFE4l7AgbPXm2WitzILwJk0Mg+tepeAXGd3O
 9da7OErOCB1vozEie6ZElmeJiEVpgGx1EB5zRFg9d+tTtmG3y+R83cr0wk/ytw72DB27nglABn+
 dH65XN03cvBAuLDIYb1IHZCMSrUjJWupCrcewWp7y9Qqzric8xu9B4QI1IWV8mh9VMF4DiMJ470
 FNL64HVy2RZb+frTEACbH+QoRiEymDPaojqapu7/w3GH+dKSlVOaSEFqjdzYJU7FyMP2cNaprAp
 7CxuyMnFUlhcf9mWAmAwYSUAYYnLxp9RUqDt5pga9IZDU04SrjPD612e0ftqMWZ6qNTgGP5uz+n
 qYwSdX2nKOwUvPepcwFv0qJxHHDXm8xNT/W/s7lp+ov9LyqPI1vBQdTp9Rt/HKF1qcFuUI/A
X-Proofpoint-ORIG-GUID: 5pXjAzpS2RVbD0ms_b0NOJqAUFlRNEYq
X-Proofpoint-GUID: 5pXjAzpS2RVbD0ms_b0NOJqAUFlRNEYq
X-Authority-Analysis: v=2.4 cv=GLYIEvNK c=1 sm=1 tr=0 ts=68596951 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=1ICI1GVrwY_GNP6_Nl0A:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_06,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=721 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_074849_792053_873637BE 
X-CRM114-Status: UNSURE (   8.37  )
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


On Wed, 11 Jun 2025 09:13:53 -0700, Jeff Johnson wrote:
> commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") added a check which is now generating
> warnings. Fix the ones in drivers/net/wireless/ath/...
> 

Applied, thanks!

[1/5] wifi: ath: Add missing include of export.h
      commit: 3abe2740e50f86401aa3518e9b69c6abefaa020a
[2/5] wifi: ath9k: Add missing include of export.h
      commit: e435827f6d0c4ace62cc9dfed5e337fa4549994a
[3/5] wifi: ath10k: Add missing include of export.h
      commit: 32c3a0f8894311c743b2a6a15b50b13d01411ce1
[4/5] wifi: ath11k: Add missing include of export.h
      commit: f204e0377efeb5f42c7c518febf82f4af32567f0
[5/5] wifi: ath12k: Add missing include of export.h
      commit: c19c24c3b9e2c4d656472738f67ffc68a9b85cb0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


