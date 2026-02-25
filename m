Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A3FD3774
	for <ath11k@archiver.kernel.org>; Wed, 25 Feb 2026 17:08:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j7HOJfjFPMkVquotJuVPSJWPzpnCEvIOb9pPizeHlH4=; b=Nq8E9a06I2q3WG39yOqgxNvv/j
	+lhPYAq3g77GXsYcTgCyFiFtqW5hnLSS719cxR/fjXcp20xy+U+c0/6hBhO3tS43PaC8XJd1xpPh+
	4sgoNB5oEEo5rWcAytONtqKIo3Yco/WqnXO4I1PdeqAjenC3Qz8+uNHlGYsOfII4RqZlqj0GKkVlc
	cWMlOM92noJ3Uyxa98myd7SUlJTbIP+Js8CQTX9/XAAEmwB2E2i6NTZfrHgjQ+PPJkGhgesTv1Q2+
	4cmdjtbWyVgMByJnwDsmeJKKv5lzaOm0cjKRnKTz650Mg2pP9qRl5rzI+x5c31PYszBccWHSLOcli
	5ARmK9Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvINF-00000004cLU-3ZeP;
	Wed, 25 Feb 2026 17:08:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIND-00000004cL9-0Eg4
	for ath11k@lists.infradead.org;
	Wed, 25 Feb 2026 17:08:32 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61PEkSfH3041093
	for <ath11k@lists.infradead.org>; Wed, 25 Feb 2026 17:08:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j7HOJfjFPMkVquotJuVPSJWPzpnCEvIOb9pPizeHlH4=; b=Yjr4AUntdJE0c5x1
	6fS323ILEA7fC8WwLPpONZ+AIq/QNvcA0by4+O0vwRFWL0408XH/d3sAjWXnbcxU
	X6Agt9uv15sgKgjvrMxS41Sw/N9zuEgZG3eS3Da8urpTU6cKTDXzt5o57T6IpLa3
	d6HK8zqyZWwsFNh09q2aWiszFc9NkpIeAAkyNxcn5gfmEE15YHIzUedl0tnB8LYn
	HU0Tv1bVlnqTOw/w1/lNxOsPZTEzLxYvoFVga1l+Hz92X9WdpayjBXmVWBHLSlh4
	X0M5L0DPd4+jtNi5mcKQSnNqJdewhtP1vGTUZH+2lK/8yw3Ug4w+TAbrP4Fx++eP
	2fKohQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cj350gh25-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 25 Feb 2026 17:08:30 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2add1118c19so6950065ad.2
        for <ath11k@lists.infradead.org>; Wed, 25 Feb 2026 09:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772039310; x=1772644110; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j7HOJfjFPMkVquotJuVPSJWPzpnCEvIOb9pPizeHlH4=;
        b=WdGLLfuOUXGZav1JmPw4/kZGfLMp0UZ8ykd57ZMaC86xyXwdiHGMATIDRLSehKCycl
         3jGAk9lw+Kob8i4lAN4rO0lKWFaIwmP69sTvUNSiJ7ORuCGZvfJMvconGs5wAeqOAOJC
         WW6zRdgnMwy9+6D+w0ICJ0REQi7wOjfNUawQThSdBJ9CO16nCDJ1tr2JJbkgihDsI8kG
         rqjSnITjQVS3M2Xg0vyUqzIZ1y1LcCa0T19KN9UfnrnMtPEjLfv2wAUvvzMEnZJPklNv
         WYhtiZ3W8pteI9C/+ZnJLdyTkUzJHurusUwkdBl0jif5+xDcpOL2gt4J3GRLSApe6E55
         ZeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039310; x=1772644110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7HOJfjFPMkVquotJuVPSJWPzpnCEvIOb9pPizeHlH4=;
        b=W4y5AUF++d6UpHNs9YyYpAs4YcNHyDz4Xm8bl8uyVNqfW5lWtYj7xiLPTFIuGXdUQW
         IcFL/ToXbQQ+fnDkN2xp7ihYkxvMdMmw41pp6+FEIorG+VM9xAeTPPPfMPrU3mrVXIEI
         eCNrtLoyok4Q76FrfkPwnIx+ZGD9JhcpV6D7rfId85FfRqYT48GBrZehAbxU/TLWSfgH
         anV5OVJzNbwKsv0sWAksVRFcDxALheacw3I3RJUovNpK7WG54H1nxAHAE1uazZ7fPuLc
         ZsT0UQD5W00EfyJeZvMP2RtlE5Gw+TO9Tdzmv6VvienuDxUQgaSwY5I5k5fvJ6P3zJL5
         75Qg==
X-Gm-Message-State: AOJu0Yw9ZK0i2NZoWyJFyBcG7fQ5zIvbTscapzmdBXqjvv09DwACPbIi
	Lh6twiepy1zdd5M/jVMF+4km21Hqy9ExGhJW1UmdbJv/OppmgcuPiXgwNgoEnPZs056PCAwdHHZ
	M2H5Q5gMUgZkKMTpHqqaQyMzNrn35QC2lSpSwaMIPTj2KXLtpJot4tdCV9bTcpxS0
X-Gm-Gg: ATEYQzwwUfKjPgLF7K7kY032tvZhhY9gTtoqUL5ykzKY7EXhZpLLeY1ppDXS6fEzzot
	PaquYxdoe6Bos8u2XEOvt47ZkYbMdPIDPwOrtrduCLqlgZX/P/0tewf5lbe/NX00JqIY/Xno97e
	7DEUSGOIx+mCUMOohbkFGS+9CUmnYbteDufxCV5S2L86P6Qb88UyNVU4hPne/cPizfp77Qtv5wL
	Q8VaT27TJpFBuADhtOx/c70CGPZYLeX0YoQwv8rvDEdaTvlyTMIzcsQq1tO9K3ALlSr3A9i5mTz
	brOCRijv7hXGw9cecq5fnEvwFyHUPyxZgBy2rafTGI7xbUxMelvVpUPVuwYB2+ScWbStUzp8RSP
	uPVYWC/+lr03wS9/ek5xLzcRHilVyv03QhWu3vPUakRjZ4IdE72TBW0S+cENiIS2bSWrAGj9HRw
	==
X-Received: by 2002:a17:902:e787:b0:29e:9407:a8cb with SMTP id d9443c01a7336-2ad74548a87mr158180995ad.40.1772039309782;
        Wed, 25 Feb 2026 09:08:29 -0800 (PST)
X-Received: by 2002:a17:902:e787:b0:29e:9407:a8cb with SMTP id d9443c01a7336-2ad74548a87mr158180705ad.40.1772039309316;
        Wed, 25 Feb 2026 09:08:29 -0800 (PST)
Received: from [192.168.225.142] ([157.49.193.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad750591e2sm139143225ad.91.2026.02.25.09.08.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 09:08:28 -0800 (PST)
Message-ID: <80a9bcaf-4045-4600-ab9f-b6a5f6f6394b@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 22:38:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] wifi: ath11k: fix memory leaks in beacon template
 setup
To: Zilin Guan <zilin@seu.edu.cn>, jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org, baochen.qiang@oss.qualcomm.com,
        jianhao.xu@seu.edu.cn, jjohnson@kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org
References: <20260130084451.110768-1-zilin@seu.edu.cn>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260130084451.110768-1-zilin@seu.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: FSqX2lwz5mNhG2Bo975hWlJO5KgwMsCM
X-Authority-Analysis: v=2.4 cv=Zs/g6t7G c=1 sm=1 tr=0 ts=699f2c8e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=hSb1S3R1191yeZY/11SCyA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=aTVLLDfeenT47zaNiYsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE2NCBTYWx0ZWRfX8BwGOeHzSOkv
 cWdCcvb/aNSvlYJxjg/RfPDFmjhlUhltLLirydtraf+0ER9hrKLxzM99WXjN6peIJBA5NcfuYmQ
 j5si/iXczQ8huZljcYatd2G2+NgVza63xPJmhQtgwgZz7021toHhWieYttWoGsMxX+cGwi69VsG
 5Y7X2pEdl6dSnCP0Iv0ny/Sayd5466aYiKF5xeLJS9P6idKLBphNoUxPRyWLpoBQEyFt5H/IB7E
 /8DZAQfgNuWD7/3fpkRviHJPEvGzJQrRzFEynHDT7MElTV/uK6DF5dMq6b4CNXM7/3qubRTd538
 UAZ8Az0Wnw1OejcCcnGEjFyhdxF/44WDNeEL6Yo2CMKoewa6YIcOlsWeDgjDYYpR4SMFd3uVXkA
 IbD9p492Q3NpQv6m4e5hkN9AYnTn/QRl7B58C+bPeMuzXi2Aa8TowTRECLyrl8cy8bju8T11jYA
 ShM0XH/0Btb4N6VVHuQ==
X-Proofpoint-ORIG-GUID: FSqX2lwz5mNhG2Bo975hWlJO5KgwMsCM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_02,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090831_126317_A12F3431 
X-CRM114-Status: GOOD (  12.60  )
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



On 1/30/2026 2:14 PM, Zilin Guan wrote:
> The functions ath11k_mac_setup_bcn_tmpl_ema() and
> ath11k_mac_setup_bcn_tmpl_mbssid() allocate memory for beacon templates
> but fail to free it when parameter setup returns an error.
> 
> Since beacon templates must be released during normal execution, they
> must also be released in the error handling paths to prevent memory
> leaks.
> 
> Fix this by using unified exit paths with proper cleanup in the respective
> error paths.
> 
> Compile tested only. Issue found using a prototype static analysis tool
> and code review.
> 
> Fixes: 3a415daa3e8b ("wifi: ath11k: add P2P IE in beacon template")
> Fixes: 335a92765d30 ("wifi: ath11k: MBSSID beacon support")
> Suggested-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> Signed-off-by: Zilin Guan <zilin@seu.edu.cn>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

