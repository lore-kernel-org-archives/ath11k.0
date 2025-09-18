Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54221CAC5AA
	for <ath11k@archiver.kernel.org>; Thu, 18 Sep 2025 23:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIYv1Q/LS+olihYR4J7ufgWOIgKK4Xs4qTjeAv901I0=; b=vKtlmsyLBmRZCSq/mSJB9gcpFL
	bXa0BzfHhi4ocq7rcQHVCW0bntQtNpQKdClluB3OmBVkQxzrO6sd5ddL1ZnpgKzKsU1LHQuGL8fsk
	tsdBCU7Yr1aQ2dRUlDHft8StJ1wanyDeyKCi5WSppymyJr80tUkLg7k/P2U5Zt7ldC6udV4HmQiJk
	TArrkJ/1xAanKHplGQxs4igYv0nIzdp7d7fin0hMhbwtFhH545dVF5cZ75b7ZQBIWqfJP0tRxmuBl
	DLV/S4T8YZWk0zFrSej9GllJKaFLCN6gKNi+PS1YCCx0y5y26VHhDDOadGd6jAaVNAL7C2cXZ8Op4
	gqGmdZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLY-00000001Rkl-0Gmq;
	Thu, 18 Sep 2025 23:47:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOLW-00000001RjS-19u8
	for ath11k@lists.infradead.org;
	Thu, 18 Sep 2025 23:47:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58IIJLXb032414
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EIYv1Q/LS+olihYR4J7ufgWOIgKK4Xs4qTjeAv901I0=; b=oaA/ldx0xd0MuzT6
	6zafpzrGhymRgMeZJkkx/jvy6HRqfzz7p4ogRULjignh5z8GcwE7Yuda7N/vYtIy
	89fWVwsow45fHKMVP7Ac2js+wXp/yoXXGPt/dA5Bi5lxZ12sR1ZvXfrPseyyzelP
	iZD4tT1KbVEKxJrYu8UVHmMLT7p9mwPjAsSIX/i5McZWwr4uh8KKhIvsETc3pBXX
	TWFFK/JCM41dFeYhuyOcD6a5txnNWF5RcLcy7MQhvyaAXqzNbmw+WeEFNqsU6Nrq
	o4WIWSGxO3gapWokN9WZT5QCdhA2vTtEe3Fd+3mg1WxscDGn2QX4xeAV22YIc/4Q
	V1N+mA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxyrd2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 23:47:25 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2445805d386so17054505ad.1
        for <ath11k@lists.infradead.org>; Thu, 18 Sep 2025 16:47:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758239245; x=1758844045;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EIYv1Q/LS+olihYR4J7ufgWOIgKK4Xs4qTjeAv901I0=;
        b=SMysZjkJY4VxVb4+6G8GCzTbtPGoBGB1jED/2U0DwpkDXl+St2N2C42hPPOEv/P+eb
         KPjmrRWOJqVTr6TXRft9gQiTgQgNzu14SlidN4nPB7nGu5IQ8Q7tPLsPHCmhgVzsR1tt
         vh3wGmv22Ge0/sbYskNSvUs6uG1OpilxXoACoeKMlaqh7qsyBlSeJ9ZTIgu4A7uBkAu+
         svSe0ByLNI92HLdn2qjCkUtzw4L+nvCG2J2rLTK7hfKVQUMRfbScLqdChk8gPHYI+HQc
         QlXnkLfCElt5wr7fLxaze9PXTKGTMRdNZ6+bHE0+S91GhDcDeN/pf7+S8T2dLvdl1ioO
         KPAA==
X-Forwarded-Encrypted: i=1; AJvYcCUaSJRdFwiyeU6QBWYajRXRrE65VlNxnPhXrY1xtEvUBV1pIAsKjfg7WEj0MLSJsrcsCfrQnQY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwVUo0BopKHCqo9HgB38Nhr+g1EhJ9fLNUp8eShDgm9kfB+ykXn
	FKYQLfKvi4M0LiiXPpmmfAoRPtMFV4PajYqsZ+V662geJofX5jQzS6ce19jYQfiKLoVgnPXW+m3
	1WZxGhkW/esj3GlP/fWrUb1jYU6+N+D6bxX5Lj/dhbj14aPZVDlEC89GSaqP/fY5J
X-Gm-Gg: ASbGncvnckutbrRiazk2kk2Vlurj13URX7S76OOSatn7BLbl24+tKHdCqhxsE/2umv7
	RZvL53S2THi/zqOvuCD0CC6M4d4AVH9xQif5bUxXAAGdpXwjMCilVv5nw1pTyPBFFzHMqG5wtVn
	RNsIfCJN495h+H5IOZgb/DfQPf99xuIPZf972uI9CfYFi8+Qs59DnqA2VV6eedbqO4ExjMQVguw
	lmTt69vAaEUMLpwiPDbK22AE73Guq9C0/3U8SWzSv9ZA2L1r8bQaaldmvljDBTqZ1rFRBsSrmun
	+kmLnawzt2o2npBOxmdl4mg7653tj45fyLliZD6uKqepSp0wq+cIYk+uc0vwGuIHoJ6+u3cQMaC
	w
X-Received: by 2002:a17:903:1aa7:b0:25a:24f2:af00 with SMTP id d9443c01a7336-269ba3f713dmr17871255ad.12.1758239244906;
        Thu, 18 Sep 2025 16:47:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBHBmTbENww6k5cyImZxHZGIMiaWZFVHZNL2EGbASC3C+jWBqojatumStFjNNCRCnzlogXaA==
X-Received: by 2002:a17:903:1aa7:b0:25a:24f2:af00 with SMTP id d9443c01a7336-269ba3f713dmr17871035ad.12.1758239244444;
        Thu, 18 Sep 2025 16:47:24 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269aa71c928sm16474705ad.107.2025.09.18.16.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 16:47:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Ganesh Sesetti <gseset@codeaurora.org>,
        Julia Lawall <julia.lawall@lip6.fr>,
        Muna Sinada <quic_msinada@quicinc.com>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Liao Yuanhong <liaoyuanhong@vivo.com>
In-Reply-To: <20250812075259.6921-1-liaoyuanhong@vivo.com>
References: <20250812075259.6921-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] wifi: ath11k: Remove redundant semicolons
Message-Id: <175823924328.3217488.17396807847892387535.b4-ty@oss.qualcomm.com>
Date: Thu, 18 Sep 2025 16:47:23 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=e50GSbp/ c=1 sm=1 tr=0 ts=68cc9a0d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=kxkDnzsp24BEM6lp86oA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: S5WnxPZWE3uIsjnTAPs74_8zMLxJmkJ_
X-Proofpoint-ORIG-GUID: S5WnxPZWE3uIsjnTAPs74_8zMLxJmkJ_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfXxicGG+h+GiMA
 V6ROmmxRsSN97UEJswWuVI1xP9FfTqa+sWZi2xmjtSNFdDn625GL8r4/HJLkWzSlM/CQpNfnQrV
 L9bTJg59OIU/VM1EqxeexSBopQG0Ucz7pezkeZtEgn6xWtxYkjeoHOaAtMtMTE2FHICCtGX5si6
 Co+wK7YHWiWx1X2AJP+piUTy09utQMDosAdQXmq1tPY/JyYMAZRuXEu6BTsp3/EvePSPGg/kjRR
 UUHWhdZZxmaM+Ajh4iZFwDoQluOdrMFm0gne5DsYYZbOoURSnf0QefoZ/Lq6i5OiCy6Ew9635OI
 Up0pA6SkKLtMUTXhr4yXveORyXD0KUVf/0xRXr1gKgX2uknEPWcig4zjjtJc7tbZ2oB0c3xrnvn
 dXrTTTUE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-18_03,2025-09-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_164726_322152_07B0C1D8 
X-CRM114-Status: UNSURE (   7.44  )
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


On Tue, 12 Aug 2025 15:52:58 +0800, Liao Yuanhong wrote:
> Remove unnecessary semicolons.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Remove redundant semicolons
      commit: 2418fcf2006804425c12d85479b9ad17c4db5e90

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


