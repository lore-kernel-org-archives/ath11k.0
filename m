Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B2CEC369CA
	for <ath11k@archiver.kernel.org>; Thu, 17 Apr 2025 22:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=v36JbYSKHIfLrXzwqyo1QHxzBL
	58wy5iM/C6IsYps4UQNdEu3DXaIIy5zPtIFe/DZbCXhh+P+3qEzZZK+qFKp6+Nr3xAw6F1a06aktR
	KPwLZU361GkpTiSmUEI5dPt4zjYMd0ll1d4gj/jYz2N9SG1ctQ2RDj97QhkAGImWLZxLqge6URzGT
	LyUKVpnIDZcXz4hmRtD72Th1gEIRh2q0E0WlHq7w/rIxy506Su9nrZA9bLlYlgJMd13pXg3a6CG/S
	WYZgXABzvYcz7nfwd4rAHY3obJEbmPrD9NcRZGa2E0161GtXi5kx1kPxmXM16EAJ9u9busXBNFru4
	+91uJvkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YB3-0000000EVZC-1cQ3;
	Thu, 17 Apr 2025 22:57:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5YAy-0000000EVTR-45YV
	for ath11k@lists.infradead.org;
	Thu, 17 Apr 2025 22:57:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HCle3x005967
	for <ath11k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=; b=fpad8Zkxw42D9J01
	Lp5PLjxxqf5lULuggiPbI0MfNVrmp0jEGN+0uxTh+/NkWruxd7+jHFzLnskQMcn7
	m+sQbV+yPVT8XkmYYQlHWjMnm4RUShnOqeJIPxOKNgHMDl5TuvSnMk+VJ4QZCNZT
	YGAtWhexjyt7PxjtxduWikStvu1jZzeDvhOXCtSDI+i8EMd+Pn9BJkY1bFzvtQ8S
	6kKfkF1OKr6Ziegne6qJP0dc/9MI+sNIngUyZXn7b4I2uEixBwBHONWmJ6ZhAP6i
	tPxrLsTnoSwzOUFHTZREzCRarse8F5mco/dQEW3kZgsCPQ8JrEB8vP+D6K4vP2lZ
	fypbzg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf6a0e18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 17 Apr 2025 22:57:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-736bf7eb149so835457b3a.0
        for <ath11k@lists.infradead.org>; Thu, 17 Apr 2025 15:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744930663; x=1745535463;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQ0AapFO2yhPVMDOZaxgS8v5NOii/sUa9QwZcbvEKKk=;
        b=g1UNhd3xygXwyKYc+1vVoQ60ttCl7T6xiFqXUU8mFNQyjnAFQW3PCEgpfd35Wb5j2d
         xxw/3NAjjo4Pbw+8ll7mWxEI+YC2UF2c9ZnCRv0OYATOLy2te5U0T8iG7ts+aHBxnCp2
         Iid076NLNVIXA7TxqJindQomS9kApKd28YM77sCemo3/yxE7OhK2GzpBH7N8PYQjFsAF
         0FgxV77AwdPyuwCVRkWUA2Nu9C9OBh84UcBSKdmPYtcSIit3OXY0HVZG+hEoVu41TcrO
         lH7gN4kS5tAcaq6SXDdN/55sy7SEY79Ywy7WGC7BnIpDRipGoHcnUAJOdh1jC7RKi6Ps
         VMaw==
X-Forwarded-Encrypted: i=1; AJvYcCWNOz+m/3dNweLgJaLQmA9UYlDDstre9Bdef6dXg1cEun05a5+hd4hqpiJWCIy9Q2xzPgmJSRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyNf5RwThVFTdvXqW1LtyxjFxudbEOjuo0I3382UBzLdM+RwYGE
	C2Aoi29OBxifRnW0q6E6e59AUrO5IzizA/TNleOhU8s3XEk8ltECpq283pDEfLIAUhqvAbyH+bD
	Llze7JstNXJj3uL9BA74uLl0vm68y1/MRIvKrZJAxaPEf3LctWXc8g+U22jIY
X-Gm-Gg: ASbGnctrwpAIPLGdek30Wcti1LXLo6mAyDlLbulRycKlR1a8N95m+TWEMSyTGC1sB7S
	wbt4/T8l8hKHa3+lclVUgnehUEr3GRWGIt3klBsQiIoRjZNmKs+N8PBE+VV7VIMRBSvO6pINSnr
	ctqIBAy1YYmzm5apGgMYuF+9kzPrD1M1V8xr2bV7dweER0/neH7TCJdalNtTYAVnPI7j4YJ/N2P
	lMBH9G6z5QNOnKRy12iiA9Czdpf9YiqZ7TDI4/JRQPsrDeTyEJP6Rxc/fKVYVzQ9LujyNhhA6uo
	JxF7/mCToT5fLaXp9FXNin/FDpmXmm3Rmh+0nb70YKgk8WHe
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806987b3a.20.1744930662679;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnBlUcOaye28+dYXVT5e8hcezLBg2+PLcejjCu36v0S/nGdgKehCY5UEe/2PNm1Uh5qKd8eA==
X-Received: by 2002:a05:6a00:1495:b0:736:a540:c9ad with SMTP id d2e1a72fcca58-73dc15d3539mr806963b3a.20.1744930662149;
        Thu, 17 Apr 2025 15:57:42 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf901187sm426468b3a.76.2025.04.17.15.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 15:57:41 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, wcn36xx@lists.infradead.org,
        =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        Aleksandr Loktionov <aleksandr.loktionov@intel.com>
In-Reply-To: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
References: <20250417-restricted-pointers-ath-v1-0-4e9a04dbe362@linutronix.de>
Subject: Re: [PATCH ath-next 0/4] wifi: ath: Don't use %pK through printk
Message-Id: <174493066126.1347382.345644321134226340.b4-ty@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 15:57:41 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: do2N7I6bM2BgRHi-BrYvblaF3RBKN75l
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=68018768 cx=c_pps a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=0rtzQTkjgJck7GMvs3kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ZXulRonScM0A:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: do2N7I6bM2BgRHi-BrYvblaF3RBKN75l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=656 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170169
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_155745_135099_265F78C2 
X-CRM114-Status: GOOD (  10.13  )
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


On Thu, 17 Apr 2025 15:19:06 +0200, Thomas Weißschuh wrote:
> In the past %pK was preferable to %p as it would not leak raw pointer
> values into the kernel log.
> Since commit ad67b74d2469 ("printk: hash addresses printed with %p")
> the regular %p has been improved to avoid this issue.
> Furthermore, restricted pointers ("%pK") were never meant to be used
> through printk(). They can still unintentionally leak raw pointers or
> acquire sleeping locks in atomic contexts.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath10k: Don't use %pK through printk
      commit: 8add2b8d72722b60c749b559db2a2aef6c9def68
[2/4] wifi: ath11k: Don't use %pK through printk
      commit: 27c57c84922ef1dc72a2ea3a5427cdbaadc9be44
[3/4] wifi: ath12k: Don't use %pK through printk
      commit: 7e7f948c7d14ab5a6cfb26146a0d4734781903e3
[4/4] wifi: wcn36xx: Don't use %pK through printk
      commit: 75f90ba47b2cda7de7a7bc1d099172516f6f96fa

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


