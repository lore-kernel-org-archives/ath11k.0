Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0755C5B572
	for <ath11k@archiver.kernel.org>; Wed, 12 Aug 2026 17:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=; b=aRxmQnUUSJzW1TbYHTtpYmjE7W
	JvkCqKZxUGu98X1QRtJKbYKnxUxk0h2WZPiKmxNk1lqZ58Q2uYwfz7G3+px/hVSFY3JHrs1y/zZHo
	2wIlbNrJeA7ZYqCD86UwjrzJxOFU9UAe49hBL+t0UVuzikor5Ls5EQZN/BrjX96bpCdYUIK/N3LpD
	TLCZ79fgARpdAEXTYBbycnZ03vpoSlp0FaixLbqSNosZJwcpsqS4YxacAwEg7F284eoJXUeDeSAtC
	fB1LlCeRvGyTHrEGPTK7tbPqn2xQhhYW70mECRVG4W/sZyux0F9wEu/mcJjSME5TfXqU2CgrEKYps
	4BXIFtzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzr-0000000GiCj-3E44;
	Wed, 12 Aug 2026 17:44:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzn-0000000GiAp-43Al
	for ath11k@lists.infradead.org;
	Wed, 12 Aug 2026 17:44:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGpX7w752168
	for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WPrUe1AHxk8839bSM8P8eF
	DTJ+/fnhI9uw2/dmjlgD4=; b=bmyaQwomX0028YIjqP24MgJYMgs88YwzsbdR2u
	+T7RI7MyNpTaNDbpHDSTcNimEmT5jUBZIKm6A8RznJU6gn5Xt1qgUVkm7etEK1ol
	eG6vKMv9gQ/WKdb9BDI6HQwq0OxMSC5anSpaI1olVLYhu/fgcYaLWM7xlfe/mFHH
	qf33+xWrsYM2meKe8wnuyQSnmCS0SzzAHTZEWW4ZBjiqTorwh4Xpm4c2wMAviDaf
	Pc7VBegBx4ffmE+JxRe4IxjIv9SbALVkyLsGhccYuntk0Fx+aTmwIgC3YzrADn9J
	jgTp4aUvglL6kwEK9qC6cGmlXmEVwypjFRpq4eKd1ZK5JQig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk41byp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c89704da8c7so1638881a12.0
        for <ath11k@lists.infradead.org>; Wed, 12 Aug 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786556647; x=1787161447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=j6BJjWhWvfa+PB/ix+Ev7N8PMlbo3TT8gn8Jy9lFLEreTGqT/0pvHMO22H8QiPJTzk
         uIg1tj7JApBlhng8JcwdDxR7dlH8LKR4dhPOf6PF47mfeAOBppMdu6YWFgQWaM07DjXf
         R98ca/z8r7zJVGgK3VHD7C2AlErs5jArlSyC5MdeLK1rKeQOPrz105QVtPsLkjVrXDlr
         wmrCc+1tepPEFSpOGzodKT7QkahWaTb0sRqDvnRkaQb7+HkFjJjq+DDWb0Luixo3blya
         VuPHVMpobILJX9+JZ/2qZkwcrjnsRP08BXhiF0JH6m2NtU0Sdu0A7Hg259Cd2YK7zs2S
         Wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556647; x=1787161447;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=JsRCXARzT1vG46F/0kf7pSFaoidMAzcMgp494g7haBHoAZkBg2j3zZQidvMCO7kU9j
         k9rvFy+jVJK/J0kgeI3ABbSu9ABg+s1uN4lFRr27JMZICey20PlgRCK+mxeHmQCJae+n
         YHVmuDaEn034rmblUVOeMRvAJhI0JD/76r7AfMjqkV1133fp8SiNQ5Fe7fSUC7bI0Imj
         BNXksCQYXQkoEt/TIAmZBiSikx1vFz8km0enZtu6Y0T+zQAABLTo5b+bBf5g47S+ze5I
         snbesOMScj408BNeNbitY8bdLvZMkRgGVrlsnjvXl74Y/7xik3MkxsuS4T3s0QVHUhtx
         QZIQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCr6g1/Pt6UQfqvBy9tv4EjIjBvEWEdkoKhayYzrVMjAbxmgyN700FdN8evENtYcdwbdpZZR0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzb7VvpwE6QNhN1TKE76EY8xhiucd1O1i1ZQgDMsKnsDA+Clk33
	oaG4PrLWQD1ga0vCiZgnKz8GxFEB9kEodwSp8K/BcQXLCwdM6Wx4Uxo/gRKBK/K4//T0RVVrqFh
	q2v+gwtwksgti1W6xs87WzdiL1me0OcfB9w2QBC5pJXJw72V5rgajMNrOLaU3mju9
X-Gm-Gg: AR+sD10lJ+OjZQyfcXjlKQBTl1A56cZlLoUrzfGRZ5Vpoa4FgNM7jfuGEUGVmWRMkXp
	oDGFRcdcfN0Y1BnXPB5SAowo7yiJomThujozFff6+VA5vUI+xwAxp8QwdfpHzFTuMgC1VGR2C2L
	JKSu/Sdq0sMZ7l7UEo+/GoW9PxJr7KTYsueSz52CX5ZO0idaRYc1XqJcOLmoVTZrmWJC1iG0n/9
	USMTJLQhDF7tP9BOD1MWdtwgt8EW2wwC4JFMuhUMB5c/MQDIlW36m7NO7/h1uY+vCY4SHifdMCf
	wJyRwObzUEWdquWfhi4SwgeVFQLZA/b/QauYaC/qG8S8OOJAYbPP9yV64uNysT29u7n38qgIPt+
	lmhGEp5zd+nicZW4qAB1KM/xFXj2BqhCErE9I
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93762637.35.1786556646807;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93709637.35.1786556646396;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31e65ffc056sm966106eec.27.2026.08.12.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:44:05 -0700 (PDT)
Message-ID: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260812
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9_osj7k5hRAzb8EbsiMeEDABKy_jqCwe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX5mweXliyin4p
 zQqEkj5cVjB+bOKB7BpmrgJoIlCbClIFrwpMr6H5tNdzLs4xWN6cotHQEZaxCWT6NRZ3zW9OSrT
 JWT/dWT/NqLnMdND4/HdJqFTtnIub1SLrlOqZD6gXAMCMNOYHlTfFJLkf0AiVoPdFFqvLNDppH+
 9dvrkwxbOgq9rLhDor8UuLYda5EmOOXjlu6jViTt/sqjKFOmdk+PXJ2NKvth+V2OsYfNVirPPUv
 Lk/9cZtW1GeRwlsSK7eFf5COtNRp6O8xlKlOlf51HnaCaPGktisaPW/eoiUn+8AoqVY3IiqBNsx
 Of1oTraBuIV3VCxl7rmoHiNrIMHyHtdtB1WKXzSPvkQvyFqxZny7Pq4+W4RQ3jONgd1YvfbX7fI
 tfy3Ani5Y9UDkLnmX6L5WAM98+9tGTUaAMm3UypJhzFUes9/Fe67KnNlWx7E+AmEyTWjVQc1J99
 yToMUMsIp2Wa/8S31aw==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7cb0e7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfXzn1yO907lDx4
 JYu+6wT+ipc3Be63VgTVCO0M+Qnsq4jp//suvtESYI0rjEb1rRC2nc09W7LyQo31MOlcEWRTOVX
 ASW/5gd05A6uk5tpJ2PSd9vr0cJH7FI=
X-Proofpoint-ORIG-GUID: 9_osj7k5hRAzb8EbsiMeEDABKy_jqCwe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104408_023219_6C0B64F6 
X-CRM114-Status: GOOD (  10.44  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:

  Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260812

for you to fetch changes up to 25c06030aa434817928ace452c06f095f14729d3:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1 (2026-08-12 10:31:06 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7111860 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

