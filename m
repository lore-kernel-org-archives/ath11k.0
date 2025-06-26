Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B5EC8300F
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QeT2KPHrUksQXiwOMplqgsQ1U+N6FD3AUDW54YPL3YM=; b=gZoTsck/ToyrON6Vjj7sdx8Kge
	xs9GhcSO9LCym6izLwY5yMZd52udhVyDeGSEDuzjzqGk3K7rJo+IbO2wJ/XZ6B4yqKOg9U0rRzrR0
	AKJq7DhiDT0dy5E3qs7I/uXbAGhUP0rGPiPVcosEeFSC2E5vONgea0b1f6QrHSBi55587GMxLDsgt
	VrQHzPzuA4mPIQIQIVnCbK4nYavdVtyNibHekP8mSIMFZTPaOQusoektQD+ojJDwq0jRj9VicQlI2
	s8SIqErsNoIpDwAjJFyR7xOmvCDIB5FZ0p1UanSsgBQUCP+4h6TXo85G8uyBv2JVPE6sO/6LC+N4f
	WeAnwnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuP-0000000DCMt-3jcV;
	Fri, 27 Jun 2025 00:25:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoL-0000000D1yO-01Rq
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:18 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJHBbH026712
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QeT2KPHrUksQXiwOMplqgsQ1U+N6FD3AUDW54YPL3YM=; b=mBMt9D9AHbPZZiji
	faXOHKt62udd2axM3q32Ucb92G+lELL1Oa3JZ2koioi5bPvr1PW2LpxV04ip1guA
	N2+9TNgFFVK7neMnzujzfTq5CTNotq+Q0N6pqg/HopAtaGEjqOSz5XfHJ7YrGo12
	Bla6Q4Ucc9rvXinev+qe88PsfS5iRl2NIc3Ht3cPwpSdj399tvXSPlhRs+KtLG5i
	QF6u3YxRUN43XU6xWx3Kke2ceuQ/gDxZ8xA848qtZjWTONDkGloblGmaNMb65vga
	cHRoCR/pOWs/a36pLw42+CBI+tD8LsqqSLhMruZey+vL1kB8jnC0sYdEeQIRr9fX
	EY3uSQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47evc5wyp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-234f1acc707so14483755ad.3
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979713; x=1751584513;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QeT2KPHrUksQXiwOMplqgsQ1U+N6FD3AUDW54YPL3YM=;
        b=W+2p9Vs/iguaLJtr0sJZVZQrV2z+mCurc6s8ei3vFYY4aYajvpoXcs+HdGc+N4/GQd
         eBzk3jWDLH5u2MLecpgc91wGt9xuiQ6ka12agAuBp02VJNH0GsBFBMFGtfkLU/K/0OA3
         twyjgL4CqirkT31sn/f4VA1jsZaEawwV5tUeQ1T2EuxbZ5FUQQWxLoPqo0lPC2eteKBu
         Iwqo2DOMjMk7welYSFXJCps2Oa4mrB1WWJQ40PTEevK4pvj78Mqk5CqhTQ7eDacjAdK7
         XZ+PKmwzucT78P2xuvbTUh9OIPICW+5Fwvvc6GNjgrhq1HoUlM5Djxiy3czWQc8MEQ9l
         c6sw==
X-Forwarded-Encrypted: i=1; AJvYcCU+ReAvXdB66ug/AcsDl204w3FIF2CoKTTizekprLynQX1DkpZdq0iI09ntm8wgSvJ++/2btfw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx82q8c3L4P+0CponVMluYMM9emxOthq79JcxkkHMuppqHQLS6J
	9NLlmDlwptOp7ojEbHxRIRUVHWGVOxn6267Scmu0rRjxBSAM+h+GvtxlTOEmkeY/EakoMPi+ZYb
	e2vwNr0rgY2go4eNnlQ+aKSnESNZNCxIVsDeTDNuZQIgUSDKJKJfX9SyKJKQNilw3
X-Gm-Gg: ASbGncv34pIUwCqYI5oEO/lzIRWIyfY6Gu8mbbOvqIeZcruE8QAowJMfV735+3yl7Ci
	cPuu8F3ZlnO8xIse0axGkOFTCXyK5NpiM3tDCHyJLYXNe8iumhvGOVUZqe1reI/dUFBxtjqTSkR
	h6rK2mkBAPcJG8OmqixKliX7Cb/mwGjGghGY0p33m6G54SgqOUmmbOEyOBZNhTQcQb4TunqCiRL
	2A7BFCOt0P8dJ/KmmLtjeUtN5LQa9UlvQFrhKyg3O0n7b491CGccm2Mi3gKHgbLbd4+IlvvP3wZ
	6nuiLF86paV/hvWW8dOB6XwpNMecB7eLrPHK0oFrca8/pfzcuSsyF9RrKh8=
X-Received: by 2002:a17:902:e847:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23ac4605d70mr15054205ad.37.1750979713399;
        Thu, 26 Jun 2025 16:15:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjZM7kfjryOD1GdR5F9TG9re8seWvkCufqnpRGD5s0uPS8B0Ynib8/JhBBMrDAQYW3NoGGrQ==
X-Received: by 2002:a17:902:e847:b0:234:cc7c:d2e8 with SMTP id d9443c01a7336-23ac4605d70mr15053705ad.37.1750979712970;
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:12 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Johan Hovold <johan+linaro@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20250624082022.15469-1-johan+linaro@kernel.org>
References: <20250624082022.15469-1-johan+linaro@kernel.org>
Subject: Re: [PATCH] wifi: ath11k: fix suspend use-after-free after probe
 failure
Message-Id: <175097971224.153431.11379630143491274753.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:12 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: sbHQdEECZ4LeBHC_uWJS1HqkHN5gHUdk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE5OSBTYWx0ZWRfX11mGbmy8GAN8
 rX5eJgyeFa6gZLCErF/CJjnEXG2y2T6DwMwDJlNo4AMYmzV8fZkFImtA4meLF3bEgE7lMqFll3+
 F/a/pXv2hw1ybnMEai0UNfAKe0vbnh3JjouBPQfDb5nj7tcWN6JA0eqJGbcZZfmAOAZIh5ACkEA
 EXKdfJ4+NJe1yGs/V4YkAxp5p+EmmNRpa6w/cuk/m6i20yRrr3x9oCVaDa2sRlIjAc2Z6W7/m4t
 NQw7/yQfM1HmtKqEc4jgjlFPDsoT6Um8f5P3nazEe2JEtDiQJdEuZxaN2DIdXZYGuuT+p8wfJQG
 0p3XxB9sBGsVQvjIBYDTjBSZAyLMMdObLsXQuB7Znd1m+aaLXuecYPbymAJveyyhAdQM3pbayU/
 qKI9l4MMrUAeiSo2RDLdeAG/9GUcY/rbw/gMLt0lkYjIQ8XPgEJpZBnzEPvExAxRezVSFAv2
X-Authority-Analysis: v=2.4 cv=caHSrmDM c=1 sm=1 tr=0 ts=685dd482 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=WD2RVSGR4ZOmZR8fVjQA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: sbHQdEECZ4LeBHC_uWJS1HqkHN5gHUdk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxscore=0 spamscore=0
 malwarescore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260199
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161517_049883_0D405473 
X-CRM114-Status: UNSURE (   9.21  )
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


On Tue, 24 Jun 2025 10:20:22 +0200, Johan Hovold wrote:
> Make sure to deregister the PM notifier to avoid a use-after-free on
> suspend in case core initialisation fails (e.g. due to missing
> firmware).
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: fix suspend use-after-free after probe failure
      commit: 8f9480451514c065dc8296c0db6e26d6c467fafe

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


