Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF881CAC597
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kqH34T9ABP4xJGwUQgNeZtZ1hEP1XtvVs9vYhgoytOQ=; b=vrfBBrVZAEW03LAWDCAuOoHH+G
	mxUlmlNOweMrfQFr5xdFcSA4TcvcVgBs4x73+AvIioJrKHK6k6QolYTrZJxF+TpaayjtnkWt+Y/VG
	uRNmBm3P04F8LJ/iHIK6jctzYCshRgw6Nt/Kfefsr3roppk2H2Dqernq/kLwceTMVdpOSTwqWhSpi
	hHit/2ZnyUhgHhBEAH4/ZpooG+TPHvWjFaeXZQ0v7747Vue+OYubFmgAeFoWoCh+zTNFUgR2E1P2i
	AU+zQNXSKC7Zbdj2vyG2rbmN0HwGkP0yQMdQ2W5iVYew7USs+McD4ZgJ5bFC7n8ohlD5j2qKrjcmK
	/ztNdD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLc-00000001RrR-1uPh;
	Thu, 18 Sep 2025 23:47:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLa-00000001Rnb-0Ktg
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IJHWZu010741
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kqH34T9ABP4xJGwUQgNeZtZ1hEP1XtvVs9vYhgoytOQ=; b=RgKoZmHIz5CSMrfi
	RbMcBs9Ln9BAt1IzebjazW6puUjSfAwl33VRXOllBsVjsmooXGGEOd4R2V/5almS
	uEyRyNvqRT4B6hLAzTjG2gOzHrdGTV4jSV+VsBs3rKG7bSvFym7/qfE6z2b0Y/b9
	nR6pl20K/Z5eI1nR9BOtDag/hmDgohntnDmuHDfGtTwN8nFsDaT7x6yxAVxiC+7w
	n+xtQJr0yEGyligBWnLSU9T2NildDhpjVc366y5OsOU/3VZz+2g3GgSMPBvSUmTC
	tNOGwBfj/VHFPcynLINI8t4UjAG9Fcf5A86NPYndm1nNpEB5We2NPbCbNzydoCSJ
	D/+EyA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxy0c85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-269a2b255aaso15487525ad.3
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239249; x=1758844049;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqH34T9ABP4xJGwUQgNeZtZ1hEP1XtvVs9vYhgoytOQ=;
        b=dERGdc8+CbttDudvON4n/UsLisHpOVi2UksLThaIcLcAinynzQVbMWupgWno7FbV8F
         2APsUnjG224Ycu/OmND0s91+4FEi/Msqa9SSfwPaf+mrdvD3+MdM9hOgFoxiruxwyW5n
         4El48WMKc5IbeL9rd6bSFAgDQNJOIwHX9KfmlTb3joLxNyQQQls8XDtTgV4yfXEYTslG
         2qGql3n4jLYc9wPS7xPy5RBv8IKfWiPbNer/Wr+9VOpLa8SbD3CuqlY44VPg2Ka1xdPB
         d2jJ6Um+P4+3OOPh/4Ser4C+aKR4n7DiRZMvBfQU2zlgLufWUUiwQE2JTNw918o5XKs1
         /InA==
X-Forwarded-Encrypted: i=1; AJvYcCWJjYxV5Oe2iIB6rQS7BUXKFtD7fi2HJ8MjzA8ot9tyiR3+iZM+kkfM6M/LO31vIVmsbO80AxA=@lists.infradead.org
X-Gm-Message-State: AOJu0YytqkvdFue2YBYtfY14244Z8EQ+HaDi4lduV0kYIRCGggOiRgTa
	73/+VZ8wz3rbrJpeSW5BOtgy3jXzApaJJcE8690eIl71QlvrT23VChJ+aWCTW7pLsTNbjWld1eb
	zpNWrFYUHAjnSok4e2SNmjGkyRemrzQId6G+xDqPatUeiClsJvg1xkcMI/J0edPAI
X-Gm-Gg: ASbGncvy3+orexzOCnZhwQecpc5FeObp9LrEgEQU+DYsyfaCTGXfNQu6FD3h/uE8OES
	FLk1A9elPvQWf7Qzg4TuvDrpcUPIWv1xcSETvuPRJZAiw5+M5Xz+3gaukm0lbJI/tqNf9XWV1b1
	D9a6jNiEOfOZzW2xVWBfrKPO9eMqQdQbnzGsO5y4c5CIC7sBOCaavHk25HTFNix3nP1WDyL27uQ
	C65f2xhClJ5eQ1VBm2mcb4AQuN6iE+v57jFs3N47AGGtcNaRzDq8zpTF0NgrVnootovxvDQyWQZ
	rWBoSyFovuFHjsfSp6MCpULHzc34Di+6XreAgvQnslKXEC9QJOxftNEikPNT7emhATBn93+BMkP
	b
X-Received: by 2002:a17:902:e946:b0:24b:4a9a:703a with SMTP id d9443c01a7336-269ba42b2a8mr20343275ad.17.1758239248793;
        Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/6dTbkLUp3A7b22kFC4mdhZ/7BtHqoap1xG7tY7v/Dt0BYlzLBuVlVJrxzIJMbJOcsmXrug==
X-Received: by 2002:a17:902:e946:b0:24b:4a9a:703a with SMTP id d9443c01a7336-269ba42b2a8mr20342975ad.17.1758239248362;
        Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Matvey Kovalev <matvey.kovalev@ispras.ru>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
        stable@vger.kernel.org
In-Reply-To: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
References: <20250917192020.1340-1-matvey.kovalev@ispras.ru>
Subject: Re: [PATCH] wifi: ath11k: fix NULL derefence in
 ath11k_qmi_m3_load()
Message-Id: <175823924766.3217488.6109469666821383356.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX2DfBMRbol9P6
 MMHX85VsS98fokLvzok7j9RWxIgRXHPzw/CPI5eZtczRUwJjvCDg44pjg6E+wj3ahm5LkRHsN6M
 0QXxRDefmy8DJtj86EV6Py3sRHy69G7rLXHTDfqqgUfXOjF8uP7DEY9zYl1f22oLMGrtxYwyT0M
 zKfjLMwj7FjUUXGYSL9huDyZR7wLbbOLG5uzMifPzX+0w/1C6+tUTZs3uoBYN2TM9eUUZ7iUbS2
 VaMFnum4kBmFZGytUwxZDF4QRvpduDabO2OcvTgBoWr8Q8JQBJi5D25IxQ60k8PxbOyKhDsVVWN
 c7HbZpeFfLUel4/u6QFR9MNfZuDBLq7OWrSvOJz9pBz6d0P/K8c9ZFQhR8KtnYLsHx9nFHNZGnU
 2GMZlEj5
X-Proofpoint-ORIG-GUID: Kqrqia9RTQH1K563QclOQgV_CFTAe0tA
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cc9a11 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=HH5vDtPzAAAA:8 a=EUspDBNiAAAA:8
 a=nfJR6hy_ZLdhEb8FW4cA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=QM_-zKB-Ew0MsOlNKMB5:22
X-Proofpoint-GUID: Kqrqia9RTQH1K563QclOQgV_CFTAe0tA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164730_147531_B3508EE2 
X-CRM114-Status: GOOD (  10.23  )
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


On Wed, 17 Sep 2025 22:20:01 +0300, Matvey Kovalev wrote:
> If ab->fw.m3_data points to data, then fw pointer remains null.
> Further, if m3_mem is not allocated, then fw is dereferenced to be
> passed to ath11k_err function.
> 
> Replace fw->size by m3_len.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix NULL derefence in ath11k_qmi_m3_load()
      commit: 3fd2ef2ae2b5c955584a3bee8e83ae7d7a98f782

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


