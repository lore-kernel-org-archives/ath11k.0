Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0337C7EE33
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0YwMxO+jUeFCXEvL4KpijnvGsNmfzPaS3I2nEc0Qic=; b=w/wKWzev1UoYtCqTlaeykhpzsU
	Z88GNWJ4LgUN1FVc8F+P+ikqCPsQygX+Vfxz+Y+5e3TbTQ+h/l4QU5lnKmjGCJShaOutv1tMfas/a
	xgDueY4mbjPnLqw6/ufGUoFUM/DXM8bMfdGGg22GLgJ14ItidEBt2ZTgJPTjnn8o9CFpJ+h99rTj8
	K9aPUSjKKItYv3Q8oqCK8WrqaJlJ9IP/+5MYLYJg/dBiT+m3APklPOFiqwxCOzUVywEbxk45XsLKu
	XJtqv4py8pwyR8BFLvV9bFO6yYUecvM8Pukka3qf5XkD4KXUNNIId2euhAz+Q0RrJhIf5VCmPrNA4
	foPQmzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuQ-0000000DCNO-36Yk;
	Fri, 27 Jun 2025 00:25:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoO-0000000D1zT-3YB0
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:22 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKEIg3022841
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m0YwMxO+jUeFCXEvL4KpijnvGsNmfzPaS3I2nEc0Qic=; b=pYmdYbH0YFfXTLk8
	Rr9gC0YnAwbd0ABqw452uMM9fvyiE5nHtWW381MHIYdL8ZRgTlvCMr/ASLT3k5cG
	zd6dys+dPH5VB83sjh8w3hduoEqGlQP0g53GktULcVS9ohrmlX3GWxBfWmcztRCS
	i4acamPjPT3Ga9m6z6vHXuKOvOdrBo8h9fO7eO1TQZqXxLGPu8fsssOeFyKvVl0H
	GtRctpuy2+lBlPgYXpZ8rdDQ0dhCo5MlRequCmqwPTGzrKcxYkT8xRAwfv5rsHk3
	1RpgydHe8wNBlf2V+COjV3CKx9oONwzZd3SzJ/mgjvjboHj2e8iVCk5juqVLtA/V
	WYvHdg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fdfx350p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-237e6963f70so21003925ad.2
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979711; x=1751584511;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m0YwMxO+jUeFCXEvL4KpijnvGsNmfzPaS3I2nEc0Qic=;
        b=mTIW9mmHoyFkiWI6QvOvmWYf1NRwPhKjdNQgG4e0XEZwljyLgnYVWXPg7RIbIWiYNg
         WQJgKYLP8b7kiRXIs11qddNOtuoe6Az/foHoMsU5uLKio4SwEyi2zDW5CZQglg20sUkp
         BU/75gFGvviyevvkdSbAQcZm687jR/i9yI1E9ypUGdZYCPNm8etBjj4chMcEhYYhB49w
         1tX1UlUq3kmGE5/lDFgZr8W3uSo1oypwU5zjeA2+cMzTGhEeeayFwCxwHFRAtutxFHUe
         cPUh8gESAoqDq58F2jeDRPANUuwxNQ1eJ3EOcqA2n7I6oRXw0vKWDeA1gh0WEwl1ywnW
         2jMA==
X-Gm-Message-State: AOJu0Yyv+cKzanR22yDaTvSRzDtfkpOUsH4320QCyshbkPao4EL9ru8e
	OGBu4+/0pYIuLxSc0LKWrQQ4YgJlPE/wQEiMpP/CVZkkY5jMUn0uxuYCo0PzpB3qv87K2Yxquvd
	CIqE04m2QafkTSIVZjvLNanOvxf4X72Lf9HtRFU/pQzCkXR+LhUd6Hqw+VpprJdxm
X-Gm-Gg: ASbGncsLOQAejMc3t6StXSZyQmz6JJR4wqQmksg5QJi1K31dzC98x+En4QZyTV+5JyA
	hsKiT4HXJrnjZDYuDJERKlnONziXz/1fuB4Wu516tU/3NXKiG3CcLzyDq8ANiBDA4QIR40aIQqd
	ylBHm5GZ247/Rz0XXDBUADEdiABlmgDSZJQSFsiW/+HOYbxdKKXqyr3bnQI4TaF64QnHdu1JI9E
	vGzihkK9WdL2MLW3xl59GXzHIrm/7WBWK2RUYVyyrzgEKPann0KHccY7qO57otP1hBVYPpxGOqx
	p3M767kx58vdZ0T3okSvIg+viMXb0w4C5dzkM6eJETg/WppdZsSTZAv6JRQ=
X-Received: by 2002:a17:902:ce8d:b0:236:7079:fafd with SMTP id d9443c01a7336-23ac46527ccmr17456575ad.36.1750979711545;
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtxZAT9RsuczoF4qvzPiB5OMo2NIectyuJIvyMQ1qsmF4ZT12KS1G8XG4t/QvX9V4JDG5Znw==
X-Received: by 2002:a17:902:ce8d:b0:236:7079:fafd with SMTP id d9443c01a7336-23ac46527ccmr17456035ad.36.1750979711051;
        Thu, 26 Jun 2025 16:15:11 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:10 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: jjohnson@kernel.org, johannes@sipsolutions.net, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Cc: ath11k@lists.infradead.org, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
References: <20250522013444.1301330-1-miaoqing.pan@oss.qualcomm.com>
Subject: Re: [PATCH ath-next 0/2] wifi: ath11k: support usercase-specific
 firmware overrides
Message-Id: <175097971004.153431.2672795252438495643.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:10 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aPkOte7bXuh-H6zdh1WZZ1abMJksVffq
X-Proofpoint-ORIG-GUID: aPkOte7bXuh-H6zdh1WZZ1abMJksVffq
X-Authority-Analysis: v=2.4 cv=MtZS63ae c=1 sm=1 tr=0 ts=685dd487 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=ZHLDmf7C8hvfDcYlofMA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX4L/6loKYch9A
 ycWZEu8G1L9AtRkUWn4FQwtrS34SvCoKNq9DHwxhmyV6fHId5k9Gl45d5OoO50Bu1MmqCp0a8mr
 0HhJiXWFg+OQaSni2b1WAQVZMZQ72DVNhOgcKHVh6rVGMzO1MvqAG9DFYL5Z2+1A27RHYnley+k
 cWnLmX1W599qyqpIkpJvAZYVERU3/F/r0QT/UvI6/pnV1x55Y+NorPd22RexMUsFbyvsomugqM/
 o5kAT7TBn5KuboV6PKrAyXwvybjt3GkNeyvueSxNkGh21gRdx480JjBqKCrmrWuNjSQG3SJI+b1
 Wg7o2bSRkdksRR1uhZVW0fF8Bkxy4il8yRzDRZ+Iphq4aWXXmHxJ3LZZvE/6S+C+9qcwBdEfEec
 244yKF+7yUyNXLISnv9S1cCLShgrrjOzQbzKsH9HNGlq0+Sgc0DJZh7QGVp/2EOe7Rs5exf3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0
 mlxlogscore=870 spamscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161521_007832_56C7D9EC 
X-CRM114-Status: UNSURE (   8.64  )
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


On Thu, 22 May 2025 09:34:42 +0800, Miaoqing Pan wrote:
> Introduce 'firmware-name' property to allow end-users and/or integrators to
> decide which usecase-specific firmware to run on the WCN6855.
> 
> Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
> 
> Miaoqing Pan (2):
>   dt-bindings: net: wireless: ath11k-pci: describe firmware-name
>     property
>   wifi: ath11k: support usercase-specific firmware overrides
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: net: wireless: ath11k-pci: describe firmware-name property
      commit: 02dcb6921b8827782e51e26593d4a2866576ab63
[2/2] wifi: ath11k: support usercase-specific firmware overrides
      commit: edbbc647c4f36e8a6375d07ecb5aad8e8b90de5e

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


