Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62027C5B560
	for <ath11k@archiver.kernel.org>; Sun,  9 Aug 2026 16:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=; b=XZp76WX1c+j3vlFLRwH7C9AWR5
	oPDiqbFsV0dUqsM8ErIZJKa+vS51co3XrsaiENa6GHMuxeB8Oy0b+FwBon6lbRyVX01gsvYwkF5H4
	fQi8DLgbGtNfMOKcpuN2e2/1sV9xuMFqDKAOof7WWXDpMGTPJxjmxHgbEfYyLTCTNaAAxxXiruTDR
	0CLzhrlk/YomweT0G/BCpqZYuz4vYOZdUW/EoXXqBOEjl2VqPy/WUASyTns/umLsnOPp4r8f/AFmP
	kx1oVroAn+SpjS5ppkBJwtATRSBGRqMkgZh/A3frU8NSUfwm5AiJiZPDvvNPUsW0cA3/2LHIh5UVE
	7E8nbCDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pF-0000000AVul-3sSC;
	Sun, 09 Aug 2026 16:56:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt6pD-0000000AVth-0W3I
	for ath11k@lists.infradead.org;
	Sun, 09 Aug 2026 16:56:40 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679FN2RW2353193
	for <ath11k@lists.infradead.org>; Sun, 9 Aug 2026 16:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FRMtojNYebz5pnxWFacqhh
	jzm6+711Mk/YGMwYi3xFA=; b=Ias4j0lIMSFUAPycl6i+j0wnbv91lYzuClBcvu
	/LmWCPr61vcusvhpi7Hu3FotmTb2GvTwmxkxxyp5+Bd+aaLF4higEAz4TVT8PxTE
	CUlEp4AQH0g4TiTZ51GtlLD7G9Vwzu9PeTW4s062cZ8sWjVrDwQpWpceb+HL5d45
	quEDJztb5nJgShcZ+JHCeBc0JMBIO1BZKy4mZT2F/pheGpgLhawL/zh9JCmdiKW9
	meBmlsAYlXo7IraptnFrmjwOOAJM3dxbi3zhtNWtuwcZxRa/Izya65riLc6FDQ5R
	fr2KtTy/koRFlERN7nVIvtLvx5yR33KzJjAONqtowAHzSoPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwmgu57f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 16:56:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cfa55c9430so11574695ad.0
        for <ath11k@lists.infradead.org>; Sun, 09 Aug 2026 09:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786294597; x=1786899397; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=ZI3a6SFtAewNMmsKR9R9+6OBhWdA4Rnw0dO2T0WWnkUttpNNRhWi6fzQwuNKtBqu38
         QOh39jJRQ8qcgQ3kfgJ4KOjIxLrQkpaVJq2esYmxcP7kejRgry9qx2Azam/ux7Ud5JBz
         WRokQqX6xtYpb9SXd6yf8saQGBbaEudgO1z82WV13thfN3Jk8hOILPNViN9z/tnC3D9R
         v2QR+XBdiCTYcczGUOtLTTAX9yz1d9ynsXlPr+iC2kMZzXL6u8lIpWGYUQBU0Hd6cWI+
         1WbvyW8wFEvAbxJsc9Vc253duBVe0sX7u/6EAk4QiiJKwLlinR/xvw2jrCVWxQicLgPo
         /f+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786294597; x=1786899397;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRMtojNYebz5pnxWFacqhhjzm6+711Mk/YGMwYi3xFA=;
        b=lyfnpTRuatHWgmVgtSo6t79LoaPOzP22oeejOB/NIOTA1IYVVCT9CvScYJcv6rEFyg
         KYpwzePnPoMmtrMgCWPaNgNMDXqpccUAONhqEzTN8EHwl/AX7DXEnMR6oUpr3vrfy79s
         ELHFjDPDvwv+qoHwRWdZHDOPGawp+L9gXu9aCnFWISVBQllTHY3NxlX3eRm4XF05x+Or
         vmK5fLoa/LO37ERbMhd6caD8qQVB72b5pMutvL1lTnwjD5c9totdaXakunfhL49hh97f
         Y+oylSznrPF4J2t7yKAXEacOhZrD31DlEQn1qq/RFUmdYSpPYrsiJlEFwm+fuq3mjUo4
         Efew==
X-Forwarded-Encrypted: i=1; AHgh+RqnU88oKn0/E7baXw/lL3IVSA6tq22GLpYXz3AF1EfF7NVc74ThAFZYc7c8jUmxADgqLh51K3A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpdVQCiq2Wy8cjutalYPxHZwxefBrCHYEcW2EZoPdutLJ4R93T
	NL5nXNhRDsJvFX5vdhxmu1NZ264NmuBRM4i7DgdAFYjpvBBpuQTQxesvZ7iWuMTvsQMFT3KrDlT
	miBrxRzgUHVOMGFNXyIMik5xpndOM1odKyInVW61wlwFt+XLMHhlb7ALT+GsAMBbC
X-Gm-Gg: AR+sD12eM+nw0m+m0v5ndSGLg9od3hjj0+zVNIFsMfWA+3qmuiHYJvOlKJ/1cTeo3c5
	RnO/by0UeWwlOBRWYTgyblETkWZdj3Qgz4qD4Tcfvoo4J4Ck4AEw1GqnmXvPDibHbLLZisOPHIP
	vy1p2gw2aEqUUkuxU1S8QbFslHQ38+1ggsHaXXRGtX2NMRY2ZVhGpq8qJt7djsy9ij6vvKNEbpT
	JozciH5PC7eNMYysWAXsYKX7wFCjggqd6dvbSh2S2bE91B7bEFqEm8tbrKpM26zuTzrVVkFXzYS
	ho4CMnJ1Gx1CXh1sKW0wKF70cKRG+4j0VQ5ozmvUJuE0ITecMA0GeMa2K/o0AELl69nWbELJTbQ
	IHtZNus2gzu6D6FY9pf7z278MATIAPWN3MSnv
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822775ad.5.1786294597469;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
X-Received: by 2002:a17:902:d492:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2d2a8458c42mr151822505ad.5.1786294597034;
        Sun, 09 Aug 2026 09:56:37 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315beb8844fsm34239760eec.16.2026.08.09.09.56.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 09:56:36 -0700 (PDT)
Message-ID: <8476e576-04aa-4fd6-bde6-e34c918ff28c@oss.qualcomm.com>
Date: Sun, 9 Aug 2026 09:56:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260809
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX8Je3MMq7Gcw8
 z9tc8HlssQoN0EMiI5/+6oel6BbUQVA/6YJ2HDtREepCsgRX3jItCeKY7eLBs6Pz5xmZv3SbGiK
 ySv6nrV6/Q20TG09AWM0YdqaZ5bv9jY=
X-Authority-Analysis: v=2.4 cv=HodG3UTS c=1 sm=1 tr=0 ts=6a78b146 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=5BXK2PN6kyUBF_VKF64A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 2NSPcG1xZSjcE3SbwXhEj__72MXkz0zD
X-Proofpoint-GUID: 2NSPcG1xZSjcE3SbwXhEj__72MXkz0zD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE1MiBTYWx0ZWRfX1KkK5dRaEzMI
 9wd4uc4ikCWAVsLEZlCbbfdhuhCZ0tyIa8JiSoZiomvJGtuIGIhAdltawljMwcZanU53ass2OfV
 irg7hvBH05f+HXRg4uBbw2iDgMJu30OBeaS+Qm1y9ggNk7y8ImDMXqhhOtGPHL8U4BelMEHMEeE
 9Pub3l1as1rSD9xABacPz8PbwzdquFMhomKFOYPJLQbnUXBJkCVolCT8ebXIbV4BUAGXIa95ubb
 uQMqpxdzxFWggEhrlzPEcNdaebEPjhpxLkpBaxbGrhpqQvSlpm5FHjgsJKSv6C3p27E0J9qvz+P
 y0HjqaQgE9jhwWYBqL/qsu49hiS6W303gTjeJ/PHciKsbZOgHAAsfSgvL3lgumeR6nLpuPNLKRz
 TXMRmGqBMj1siG051hJwwu6Aq0+uf0prYFQ24keMIJPZ+yYk0Y9V2GDhCSkU+OZiF11rB8Q1HQu
 zWKsbqc5yJdRHWtl2bA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_05,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_095639_217398_D1419AF8 
X-CRM114-Status: UNSURE (   8.95  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath11k or ath12k.
For ath10k, add board file for WCN3990 variant Shikra_EVK

Please let me know if there are any problems.

Thanks,
/jeff
---
The following changes since commit 16d815da3637f645bc67e4c71b757e70ae44d498:

  Merge branch 'airoha' into 'main' (2026-08-06 12:07:51 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260809

for you to fetch changes up to 796029ba95ac00dec03264eae3807e0ea0ae988c:

  ath10k: WCN3990 hw1.0: update board-2.bin (2026-08-09 08:00:34 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath10k: WCN3990 hw1.0: update board-2.bin

 ath10k/WCN3990/hw1.0/board-2.bin | Bin 867116 -> 893528 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

