Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79843C7EE32
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6v7dg9aLq/3BqM4qFRm/sKBzay6K+XSiGPaARUEG1es=; b=SaJocGGNF650YKCiOCHijXEGEj
	fE8GRYCBlaFXQUHG0O1dYZA9VHgMhmClAiO9b6AY8yy7/YIsnbqCnINQ9jIAyCi4poX1pJV5N9d0W
	tDAZSZtaiUOgoxLyoBWVa13e0LwiZcy9io7pZHk6Pi25+/1s0YXgwbrv0zaaef+ebPsCLx+4XGhjL
	JmQySnh+M1sZphKSaRZJZ8licl7dH1PuW9XNHiJP36PFZtc82qVoG1tSaUmPvgLZiGR0tL6QORndr
	vDhfzdZAPYnHrSaIZ/uZSVcxCX0n/lyAbOhGQWsqL0ltnNqqflgFjZ2vW4e3wCVHSeDC8RlW4Rf/e
	XRdCsdRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuT-0000000DCQE-0naX;
	Fri, 27 Jun 2025 00:25:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoV-0000000D21v-0giY
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QLGtip013292
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6v7dg9aLq/3BqM4qFRm/sKBzay6K+XSiGPaARUEG1es=; b=m90FKIykcJWK3qc4
	Qv9Ed4RAfvhgxTeYtwMNMi9vtrOs5pJYqukOEu03Cg4w/1N7OyuiONKoJVfjOeqF
	7dd7neKGPYXlW/Fj0zDuVYJYF8AVwXsbIPPcsPeLKbdA2vsLgLuiyREYn07Aqe5k
	KX6SXBahwUH2Jo0VDAI11HGnWGmbHVOo53Qx3MV1jYsIMSwG0HDiozSXMvQ5Y5hq
	xGRWHFn5lsm1CS6NstTlgCsNF9kjqPmDGfsMD/GrvuwvB6f6tW3m2Vdy9ljI5jd5
	MYJSzW7Owoou9l1cAPQ4cb7FwD5dj+WJVDNbMYYnc9bhyUG6szBw/QYBMnQ/e5P/
	PZ3LLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmt3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:26 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235196dfc50so14154725ad.1
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979719; x=1751584519;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v7dg9aLq/3BqM4qFRm/sKBzay6K+XSiGPaARUEG1es=;
        b=HkXV5C8UgRhtFS/3Zo8cO+8qdlCMtWqCIwAhXFjinhDYHHICzFS//w71xur1Me2qbD
         2j/bj+EpPdszn+26Xj/eyzuws/g9m6fHFCXdbPuMwuRE1RNMiuRVywJXAvIjTLG61JmJ
         zC8W+8e74WK1evv/VlTbqtb8QgZVa7qzu4CctRLixI+W6/emaAU0gIsppgRECZizqmDl
         9qtM6dABv/OWYKW4b++9OUCV5UGbTt2Ek5j5DX1eHWJGRC8ny5YtGyhabQQb8Gqi2De0
         JfLZb/W/V2x/SpE3mKyWYID1+hjdW1HoroVoOAdfZEyrERgbvSouv7fc3GJFP0qpjCEw
         oyyA==
X-Forwarded-Encrypted: i=1; AJvYcCUCXqQa760miMXk2HkPZFq9MKqd29qqwEEhEfmKCxasbA1NsWQOgKW0JfEmDqlUpQpkAfkq4l8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyusdTh9iWDoXfMs74XE0AdlxGuHvcRQoHPUE5NWMQbJKg7Xoab
	rJDRX2/F3qGIzlg62RUEpH87hjrPpFX6Qor8dHx4iOhpjT15l3uWCG1l9bbBxjr6UHqvLWwF2TI
	OFLtoteIUreiO4quvtjkSj8C9My2jvLja1TudcKTtaehww/eLxY5tC91QROk53CNp
X-Gm-Gg: ASbGncvoO6aoq664+zb/K+jidZ5hn7wGLefY9ymWOlMFrfg8jx6X78ZvERtQ05exOmd
	TFkA+KuBDmCRuvUg4L0fJkTx2vSwpJmhRdZQaSYpaKp7Oj6lw6cEl7sug23qxiwGVuSY1cooXGh
	9AQTAyUddv8sBNvFHHZ7ikUg7JjM19EhmYdKgHFJLHCh5s2nYDIVSGakCLw5tt6fcnh1GnbT61E
	j5xrEwP3DpCsvcXDv/wpr7K8OifmtwvrfyM3Io8sseRB3bMbtrBsqtFg69rofJwueW+uowZWdF8
	/aULhP1ZA5nbkyvMDaRA4J4IKu+MtdTULrHAbYenxHys7O+TH0OSEbZZqYg=
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr13412815ad.13.1750979718663;
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8MyYb5DgNriJcxgS1vLDwImzLrT7L7rSqE74R6A7X3DgIB+k3j9LmAbjtcQvtoy2UgGWcIw==
X-Received: by 2002:a17:902:e5d2:b0:237:e3bc:7691 with SMTP id d9443c01a7336-23ac59ab6a4mr13412375ad.13.1750979718235;
        Thu, 26 Jun 2025 16:15:18 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20250604143457.26032-1-johan+linaro@kernel.org>
References: <20250604143457.26032-1-johan+linaro@kernel.org>
Subject: Re: [PATCH v2 0/5] wifi: ath11k: fix dest ring-buffer corruption
Message-Id: <175097971753.153431.15108889978896769332.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: fj22t5rMVOlQSWyn9wPNbcZW5A2eh-za
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX+Nqn2TiO+8jE
 KH4O+/4vjxxSPUR1ViGFH04gq0/e+sqkiEbS2rz6hPd6eMeDO0A3rYv3pAEtGEvK56l4HPv29fw
 hRJjOsv51AZqtSHtViA20DXcwgvrda92770OiUVR1bS3o0DHJW5RLz93FN/O5eTUMARS1+I0bHl
 u6KoGu5w7YfdOouo4i+c17CQ7zU6WVQHX7PP4kT5Fng0NnnIm3Psdvr7yNAbbD4lZ9VfmBgTFcK
 GVxGXNKGBG4Wq22BjJm/Apop6xwbsIslmp9U21gvot8I2gpqqAOurMwJwCD5D8rEWNcK5AFCOEQ
 pA8hnJhNVTeVTh2QNrUOJ1ioAHA6wv1SXTRTEz/9xf6xJ8z84ALP6zpYYHl/gXrFsR6TQXpvcBs
 H5znClnYK6NXpVW9vcQiNbiBKm2lDVdcvMj7UVS3yR8MPTSfDX+awaLwbVAhlIafgLAiicDJ
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685dd48e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5RTc_1txDYSjDPOt6ikA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: fj22t5rMVOlQSWyn9wPNbcZW5A2eh-za
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=952 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161527_320432_0DEE9DA6 
X-CRM114-Status: UNSURE (   9.39  )
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


On Wed, 04 Jun 2025 16:34:52 +0200, Johan Hovold wrote:
> As a follow up to commits:
> 
> 	6d037a372f81 ("wifi: ath11k: fix ring-buffer corruption")
> 	ab52e3e44fe9 ("wifi: ath11k: fix rx completion meta data corruption")
> 
> add the remaining missing memory barriers to make sure that destination
> ring descriptors are read after the head pointers to avoid using stale
> data on weakly ordered architectures like aarch64.
> 
> [...]

Applied, thanks!

[1/5] wifi: ath11k: fix dest ring-buffer corruption
      commit: 8c1ba5091fa9a2d1478da63173b16a701bdf86bb
[2/5] wifi: ath11k: use plain access for descriptor length
      commit: 3a690e9091ec07f70cedd9a7dcc074c8554f1bed
[3/5] wifi: ath11k: use plain accesses for monitor descriptor
      commit: 4aba95fb1faed7fe7f6e1edfb60c333e0275dfc1
[4/5] wifi: ath11k: fix source ring-buffer corruption
      commit: 6efa0df54022c6c9fd4d294b87622c7fcdc418c8
[5/5] wifi: ath11k: fix dest ring-buffer corruption when ring is full
      commit: aa6956150f820e6a6deba44be325ddfcb5b10f88

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


