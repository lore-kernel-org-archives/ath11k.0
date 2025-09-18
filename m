Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38079CA1013
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=; b=Bjev3cDsLPmxbU3P3/D6EA/Vsn
	oZ6uV5M8Ve4qiomIusrGUNO6D9phdkcCGlljkzwYDa04QgZ91CkZBGOUHLoW7xzkCUE5PSE8dKgUF
	jkv6ufeoh6lVHOiuXxJlV72+pzYb4voCF8jAN6Mj1MA0TILWVwG/uD50TvukTuSJTkjBSgyYkJY5e
	EAYVbsCrrh3Bc340ZcrBFElZLSY6oudGrmtrVuWq9TrD5wXbYo4or8PCZgtHjUMmIbG4MU0VxwJlQ
	fVg75UOxm4YyKlYGWGRkOeJS9idyLD/okftVPPZCxKC6vQNpIyLSYf28CNS+v4Idd99FS/hskO1aB
	hRP/lKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLb-00000001RqL-3mix;
	Thu, 18 Sep 2025 23:47:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLZ-00000001Rma-1rel
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:30 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIHGiR026824
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=; b=cdoEWxOevFYldDZ1
	7shFqLJcVR7S2J+1BMaQp7OlvYeakOfIyJPZOvLm9wGWhgyPpKhpho1Msr033Ysu
	r+3R5rxVcRC2kJmIBIftrpLerlAWuUq8bKl0MsD5cZ2FpepLI7M8+3dsdodM6W67
	GUXb3GiyLb6nx/mTqSbErtC4fUA08H8/dXU7eaMx+lsvvTetoz8Cv21JntI62ogL
	RPlOKJGNpHNhFmT7+8KUavB7b1UhP2N+9xpeJRrMqyA7D2BosuaPv478uZWJx/En
	8J/AucA4AUhZ4xXJficUVjBKTmF2lBoU9RlUP0p1y2i9ZF0tH1lad4OShjcBM9HM
	5x//Tg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxt8eap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-24458345f5dso18818745ad.3
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239248; x=1758844048;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nAdnGft0CDmvsgciSrd1Q2OfW5SxaJi36vRRvFm88Ec=;
        b=WzfYbyWqw+C8ltE8V0GYtkJI7aTEkFCgj3XGP7QX4E4D2ySC7Fr0E0raT+UZtq2TjX
         eyOsGHn1KTsROvy74cEjmFezfgOdqp4AmaElUqa0TiFOugx1DFFpO8lyJcKGfKs0NbOw
         Fyg699vhfaxJrZEeFtDDIXaKX8r9pNoVPcJuCHio+yMpNC0P/bjdFXFbY9HRhQnZwzAC
         BUAlkIc/uapP4nACmsrj1Ecs02BI5+eG4PyMTMLGAwD38E0Z1daj0B0HvyNPZAt0AXuW
         LWLUDvoRHCmADN6lYFmA6GTk8blRPeQviwBJ9bAMD85/h2qVEnJFvwUdGqeMU943Ldeu
         leQw==
X-Forwarded-Encrypted: i=1; AJvYcCXk4I+Ff/yr3M792bTNC3sI+hF6yrQu6VcvJzGxIKbmGjTyqDiDnexLak6I7eiBRqIL5NFanEo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9QqKCZyW1b2rrKBJMpdft5g16PPUfBwLvBlytoG0f+vLYDL9J
	b7TFpa3HP6YT59463peutrEmH5LXhTJ117sWN9f96Km1rRzyxlvsGkHAeL0J4XPCjhrktdssGT2
	23hRpQPzxK8j9EjmKmlRADMRzOuCabCnnxQ04jJQxmGzSDugHfObMvOokHqq6k3b0nhpwOHkr
X-Gm-Gg: ASbGncvFnHxyaDgeuirIvu0lHISeJbE8FiYuDj8Q3o9gf/vFfkjikjQLbGTgv5D4Wul
	PUrxfg3Zw7GZtfQ9LJy3QwowpymfDxgvWYTEihlWOGDUBQAtlGUxW9+Wk5hxtRDJSXXng85smTH
	5hTwLTO2WTjykvoDoixKaWpjehX8coJk94pKcIkhJS/nAGL8JJx23J5qH2vEyDBEhVV+DW2ZZu0
	bfPBhRZvqACLJd/0vWbRM1TddYV2gKENNRgSZ5nyaJEyPcQNNR5ClA9B5PnowTaTZsvcbKk1/g8
	XUihal/DQwQM8HHwbUxIJ1e20WGdycP9yFDt/Mps3oFfLMh+jYEXE+agF/GRE1+/aow8KBt2wgz
	s
X-Received: by 2002:a17:903:19e7:b0:264:f714:8dce with SMTP id d9443c01a7336-269ba5081d8mr19591755ad.36.1758239247938;
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6pdrrG/kT5DYHOezNz5h9+nn4BGxvAI5GesrnV6WPlcXl4zeyxLYLeOFQ2LPNRUv0K8Q2vg==
X-Received: by 2002:a17:903:19e7:b0:264:f714:8dce with SMTP id d9443c01a7336-269ba5081d8mr19591485ad.36.1758239247501;
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:27 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org
In-Reply-To: <20250813214933.897486-1-robh@kernel.org>
References: <20250813214933.897486-1-robh@kernel.org>
Subject: Re: [PATCH v3] wifi: ath: Use of_reserved_mem_region_to_resource()
 for "memory-region"
Message-Id: <175823924668.3217488.3526211732380687793.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:26 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: b9hGj8R4JvxrtXY4ORUv9IZqEswR-dBu
X-Authority-Analysis: v=2.4 cv=bIMWIO+Z c=1 sm=1 tr=0 ts=68cc9a11 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=VjuCZWrZiTeoWwOd-AYA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX70m26M0Ex1EY
 qlirEl54q6mHOc0TVgnfmYrw2wfRCx35OKoZFzpTCc6ZwF6MYCqkxVWXuYNmU6+wwbg0rPQePVA
 mT3xPUdOtfbFhDM1WVM4v3tKUVps7iLRqQA2Y8Y/hynMVjTQ+PdZvZWF53GVNhqLeWh/efdd0xY
 8+HJsgiK/CM7VOAvMV/RGwpeI45rYVeez7Xs4NZx0OMtjyIxzEVeiSpglXosEGAGmuV6PEu6VP4
 qmoFevDbnGYJ9goS/0rw6iWP1Z2M9ODKLl5D9S4oWeSAZHHrLAn6CyNX8laX1ncvhyJ1sufcdCd
 WGKc62CfKg1ASclyHJExk4lIev75d1gGSVLBDrqA3m89MlLkz57tVFvui1TQKMpcP1LutCx2mPT
 f4Be4v35
X-Proofpoint-ORIG-GUID: b9hGj8R4JvxrtXY4ORUv9IZqEswR-dBu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164729_491790_0C7E2EA3 
X-CRM114-Status: GOOD (  12.99  )
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


On Wed, 13 Aug 2025 16:49:32 -0500, Rob Herring (Arm) wrote:
> Use the newly added of_reserved_mem_region_to_resource() function to
> handle "memory-region" properties.
> 
> The error handling is a bit different for ath10k. "memory-region" is
> optional, so failed lookup is not an error. But then an error in
> of_address_to_resource() is treated as an error. However, that
> distinction is not really important. Either the region is available
> and usable or it is not. So now, it is just
> of_reserved_mem_region_to_resource() which is checked for an error.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath: Use of_reserved_mem_region_to_resource() for "memory-region"
      commit: 900730dc4705dc78f9bf69c4c513ec018bffee37

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


