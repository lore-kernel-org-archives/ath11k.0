Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170CDC3600C
	for <ath11k@archiver.kernel.org>; Mon, 24 Mar 2025 15:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nH4aeoaJ2bY3RhjpBvj4Vxj6NTdJ/AFDG5izM2nQcDw=; b=10V60420qkeuRnbApxm85aPp/z
	Mek1Ao881zkqhnOTaFDVVWpWD1wT9h4a5s4c6jF19rmVUkz0/ToaWqmVfYXU6fpiFbVAwuFnhhrjw
	0et7/cCLtMKJt/Yil1/P5DOn/Mp2Udjq9QLDZTDSblIcfSJdT3Ghgn4TICTP7JzQ0Lj2Q60AfbKyl
	5kXgOnIr5H2dvIYRLTPoFHOLH6vO8hTY3OGk/q3wUWZ7ji1z2gb8MzEm/TGHQYeopYUSx/UsDJTqm
	LHcprXL63Boiunsv0Rr6VMY+fIboBapAcGcpr0SOkXS5ZKpEFfYhGuFgzYKuoGFFWTaDD/bAIWR5c
	RdDh2lLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twjKm-00000003TBA-2SZB;
	Mon, 24 Mar 2025 15:03:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twjKj-00000003TA7-25BF
	for ath11k@lists.infradead.org;
	Mon, 24 Mar 2025 15:03:23 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52OCmdsx025373
	for <ath11k@lists.infradead.org>; Mon, 24 Mar 2025 15:03:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nH4aeoaJ2bY3RhjpBvj4Vxj6NTdJ/AFDG5izM2nQcDw=; b=N7Q4LOYXUuaaVvgi
	l1okrk8+L6tEVc8sAsxHzYetGgDplc1MWqBxjnTEowSOjZEgv8QGguRmkZ05WtYb
	R1mm2WLw0wdrJHTatytur6YWKvL1r2QAFCQhDzhcev9gxk/kEd3tzr63UXa8EMdZ
	ieYH0z7dYOy8CBc/TfrD+N57+pzYyDkYUmiQ6SiBYZP9a0nii/cg/HraHMLU/RqH
	ok3LtIVzOKEwDW1mTNoGn8hBQnnvZQ5QBZHdDWf7pxY8IiDk6l2tgA17k64vtKKg
	dG7c6ezC3oFrXpD+BkUx4C45w6OPZxg38wmz574mWg9ts3f5N1BIrRL0iD+NVklw
	x7Uw5Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45k7qj8bgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 24 Mar 2025 15:03:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240c997059so101758075ad.0
        for <ath11k@lists.infradead.org>; Mon, 24 Mar 2025 08:03:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742828598; x=1743433398;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nH4aeoaJ2bY3RhjpBvj4Vxj6NTdJ/AFDG5izM2nQcDw=;
        b=bG7gyVum+i1vy+g/pON/U80cMh0ww51nKIaMborM0MW5hpic6/ENCJbGDpTeeT04eE
         pPhkJ33GC42ll48DZYgFR0F4PygkBe9sg1ZjDByR9MKCfNAQXJ0eaHaIBQuib2aXlVKc
         EpNVuCe2enqlAVB8Ap7JFm67BMI3fCQgFcEP9aauymNt0GvQZs5gnfiD/wHSdJ8qkqP8
         0vjrzjM6fIEx1O/zG9kNdptdSQGLMeZ51tvmvGKrKvadPMrGojqBUfG/keNFCz42drbA
         Nkgsk7WmWSFR0p5LHSUXNiPXTWe6xwquOW3JZ0iLEWFlpNjxY+Cv/jsI0djI0tdqkbP1
         SOdA==
X-Forwarded-Encrypted: i=1; AJvYcCWEJ2FvcD1U7aMPLPsB0Kyd1plDZZKqatJuIsqof+rw/V8t96hgIq9b+atRMBT6YJJLJA1poB0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaZxJ5z/s2HWI8iVs49zfcgX7n2JokJR6HN5fEguYxvrWV/W0U
	hzYso9RtpMRhBvbptVYYFwloMuPurfQQNzcNQsS6AA5dzR0k8Np/wIP++xa4D1dJV4yGmCVeIWJ
	Q6Mb+C5dEPbVyyM4eRQTb0Ls6Dci/W9onmpCYlQ+3ZOamPUQ0cn8aL9+3TPXn
X-Gm-Gg: ASbGncsyLlTn4Qf8Z/Njvs6zQ3ydLqFN+2Ho7nQpxmWgqldTE+O2dsm6lLH04HGJpP1
	V9eFg2aPmDKk+btIpSx59ibmfdA1nXi4kafBknIyFrTaM1O4iydKzjAj/SBKqSnfmw3QIGoBcKw
	JHUJmO++P6hdibMFB2Dg4MkUVqKccLHSjwR3aikHK8J/8ue+xEL9UmlXF/4jzBQ4NlzWpId8PLS
	+wIsczMB5P/CNhaw17hwa/5QimUgNOwTYpTi3lW5DEoLZ7unE6sNP8kHVnFggsBHQJGv49qKIVd
	8E+DSvgBy/RWk6PeK39uxuX5S7u+4I+y6sSys0gfeqFm/thJ4IYngYT/4fnV4mSFFT/YPS0=
X-Received: by 2002:a17:902:f70c:b0:224:c76:5e57 with SMTP id d9443c01a7336-22780e02a4emr237465375ad.39.1742828597677;
        Mon, 24 Mar 2025 08:03:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH828wzul6klWb3XsCB3+zMsH7vOJ7XnnAtFTDduSHSdwmPgp6DaMF6OMFiOhDbgCT/iquEMg==
X-Received: by 2002:a17:902:f70c:b0:224:c76:5e57 with SMTP id d9443c01a7336-22780e02a4emr237464745ad.39.1742828597066;
        Mon, 24 Mar 2025 08:03:17 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f459fbsm72138365ad.78.2025.03.24.08.03.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 08:03:16 -0700 (PDT)
Message-ID: <5d872cf0-ca57-4017-b06e-fce9c11813dc@oss.qualcomm.com>
Date: Mon, 24 Mar 2025 08:03:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: fix rx completion meta data corruption
To: Johan Hovold <johan+linaro@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: Miaoqing Pan <quic_miaoqing@quicinc.com>,
        Steev Klimaszewski <steev@kali.org>,
        Clayton Craft <clayton@craftyguy.net>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20250321145302.4775-1-johan+linaro@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250321145302.4775-1-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mcDwIE1IqUONhewz-5Hszt6DZ97uBL39
X-Proofpoint-GUID: mcDwIE1IqUONhewz-5Hszt6DZ97uBL39
X-Authority-Analysis: v=2.4 cv=feOty1QF c=1 sm=1 tr=0 ts=67e17436 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=GSe8ykzKO7dVpNIIvtwA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_04,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_080321_561686_5B229BAF 
X-CRM114-Status: GOOD (  11.53  )
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

On 3/21/2025 7:53 AM, Johan Hovold wrote:
> Add the missing memory barrier to make sure that the REO dest ring
> descriptor is read after the head pointer to avoid using stale data on
> weakly ordered architectures like aarch64.
> 
> This may fix the ring-buffer corruption worked around by commit
> f9fff67d2d7c ("wifi: ath11k: Fix SKB corruption in REO destination
> ring") by silently discarding data, and may possibly also address user
> reported errors like:
> 
> 	ath11k_pci 0006:01:00.0: msdu_done bit in attention is not set
> 
> Tested-on: WCN6855 hw2.1 WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SILICONZ_LITE-3.6510.41
> 
> Fixes: d5c65159f289 ("ath11k: driver for Qualcomm IEEE 802.11ax devices")
> Cc: stable@vger.kernel.org	# 5.6
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=218005
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Does this supersede:
[PATCH] wifi: ath11k: fix ring-buffer corruption

