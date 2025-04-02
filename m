Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B86FC3601B
	for <ath11k@archiver.kernel.org>; Wed,  2 Apr 2025 15:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eg6GgdeUcQfqxQMUQCNQ75dZQxRkdOmu844TCJTbJRk=; b=jBb62js9laCa671AKrFj0I6px1
	niZUcV70/Z5hTmk46U84gyJgFRVRwjsQek7TwelavJoDmY/rTNJQPqs22Vd9k6lkZQ7AkBunsI3Pj
	mQdlu+/rR+CRdV96dKHZVRHmPqcqusPaT9+CsKALdSEvHUo+Z24suXGgbgSAQN4i6usA5l38vIkiu
	0aE/KDc2epCnuDoqzSVCYaN+Zyn17f0m/MyIGFVdDi+KkgNpH29lU50X5/d0dTJJ3cN9+emtwFrcR
	ocRAbF00IDgCYUbBZKl4XOSGY0blKhO4k8inG995FaD4vml5VIa2WESay62xb2SuHqGIEhHjB5GbP
	OO1iBCjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhI-00000006T5C-3yHj;
	Wed, 02 Apr 2025 15:08:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzzhH-00000006T3q-0oSf
	for ath11k@lists.infradead.org;
	Wed, 02 Apr 2025 15:08:08 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532C1hHe024534
	for <ath11k@lists.infradead.org>; Wed, 2 Apr 2025 15:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eg6GgdeUcQfqxQMUQCNQ75dZQxRkdOmu844TCJTbJRk=; b=aJQWSajGbNTf2gY7
	RKzn59dQfOH5AVnkHP3x9HeBzD3vPNr6gWtw7cdIBl677xQsg1i2uXkwaa7kHEa9
	266gJcJzjePIyAkjFyjUnniAEaGcNI1fY4+Q+Q8/VhJuiAXKEr21ujf80pje1xCq
	4s4s19/WrFowoWs0H2b4uvpF/LgnDfYwvCr25b8ccm43HiXkg91mo5NEcrm74g/6
	qqRY01hQBS7ZmBtE2gVCdw9uGES+KCEYU9l0Hk0ZgLMEwM/tvDo1dA2H7p/jKlc3
	Em0KdgX0cyw5213EEkLXrmabJ8vGP0Ict1uT7fdBFBEIvVB9sB5pxIeB0elssTjA
	HQiGKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45rbpyvvvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 02 Apr 2025 15:08:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2242ce15cc3so124551225ad.1
        for <ath11k@lists.infradead.org>; Wed, 02 Apr 2025 08:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743606486; x=1744211286;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eg6GgdeUcQfqxQMUQCNQ75dZQxRkdOmu844TCJTbJRk=;
        b=KcDEwSLFwoMkVhKd+xKsH9Rsv6ltaqWIcT83npiM/yyhXrrtKy7kfo/edjIIlTs+w4
         DhMysX/2ZagEw6N/NM5Nz+NNf6pZx4UMBNX9R6C9hfZaaj0bJ7go+5dJ8QagG1p9L4bz
         6TvlNivWuOLHHx8trSkwzW2Xpv9DYy17hXUmd/zlExYIPaF4+YHMGq+6xDg/QxKsyc2P
         nSCYgaL2cgm9bB/V8ieYu6bQtMEfmKTER2xFJuZ38ZnJ6V8Fq+9/lv9tURbQAK2E3EWL
         36cl/Jm4fUuY9dtWUp5JwkqaMQdUR/Vlqqc+YrWWhLT+OdXfJ7pS0YmXeILbNhl1Bb8r
         smgA==
X-Forwarded-Encrypted: i=1; AJvYcCV/w+reYswEcO641H/R0K3rmLQyT3ptbw6Wy1kOdWEuagSFmFFIn/mX6RQBjXDrnvRJQHyOMAA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDi3dQ8Nsbaf4jZxO+EzISjm8FZ6EBkeZ3/zrNzsbk8AWkBNjd
	+nJjpxwIqmxxyBSxurmR7TAGpx5Ql0GQe+DDD2QbNYhoeMcC8SgGVwBAPOm1RlD8dzv4RSf1eJs
	r/RtsN09krgSDehUu8S/3N2swrgFQOqBqUGmVI0RNrpOf2GBJwgD30C3kTHNH
X-Gm-Gg: ASbGncs6f8OTg8mj7udmgaJq50z5OV6lS419pc8Z9T2nZEBprocykZHiOtJJm3lwLjq
	t4DkUahqM/HtiULO0zqzpa28c+Xv+RJYOU7zG5Hhf3fgqnIwwUUpwC51U6WMuXrzlcDz5fb84+T
	MeeQsXd8e8YCBxOHHLxLSVF27/XSaK+ZlHyP7dPyS6xj+8cPiZItuoxZbMM2u3t1lA23t9WQaXW
	G8UkagCQ2L0TyIRJ7YB6YpNfSWEAWVQ1sQYZIRyzUPF2mjLSH4JXs9msNhXBJpRNd5yDAiqryOS
	/5TqpyXxc82pN7a5AniFrRU/FbcadUMNctEI4a4OuB33MBnF2iGm
X-Received: by 2002:a17:903:181:b0:221:7e36:b13e with SMTP id d9443c01a7336-2292f960d81mr259356495ad.12.1743606485443;
        Wed, 02 Apr 2025 08:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE5qD+8L0lBGoJulsYZKR5ppKHZkUdhdPhWi6pZRdHsgeGyZi0q6BLIkrUN8HgUsSTbK9wvzw==
X-Received: by 2002:a17:903:181:b0:221:7e36:b13e with SMTP id d9443c01a7336-2292f960d81mr259356055ad.12.1743606485051;
        Wed, 02 Apr 2025 08:08:05 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eedc988sm110193905ad.59.2025.04.02.08.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 08:08:04 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>,
        Sven Eckelmann <sven@narfation.org>,
        Muna Sinada <quic_msinada@quicinc.com>,
        Govindaraj Saminathan <quic_gsamin@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Stone Zhang <quic_stonez@quicinc.com>
Cc: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        John Crispin <john@phrozen.org>,
        Anilkumar Kolli <quic_akolli@quicinc.com>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_miaoqing@quicinc.com,
        quic_zhichen@quicinc.com, quic_yuzha@quicinc.com
In-Reply-To: <20250320053145.3445187-1-quic_stonez@quicinc.com>
References: <20250320053145.3445187-1-quic_stonez@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath11k: fix node corruption in
 ar->arvifs list
Message-Id: <174360648372.2001642.3342805114344594348.b4-ty@oss.qualcomm.com>
Date: Wed, 02 Apr 2025 08:08:03 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: H8I66Z5rQVmsCJOmPO1zvJkP_ipFzMbS
X-Proofpoint-ORIG-GUID: H8I66Z5rQVmsCJOmPO1zvJkP_ipFzMbS
X-Authority-Analysis: v=2.4 cv=ZNLXmW7b c=1 sm=1 tr=0 ts=67ed52d6 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=G5r7sExCSuRg-0v4KYsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_06,2025-04-02_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 adultscore=0 mlxlogscore=953
 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504020095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_080807_250246_EFA63A97 
X-CRM114-Status: GOOD (  11.24  )
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


On Thu, 20 Mar 2025 13:31:45 +0800, Stone Zhang wrote:
> In current WLAN recovery code flow, ath11k_core_halt() only
> reinitializes the "arvifs" list head. This will cause the
> list node immediately following the list head to become an
> invalid list node. Because the prev of that node still points
> to the list head "arvifs", but the next of the list head "arvifs"
> no longer points to that list node.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: fix node corruption in ar->arvifs list
      commit: 31e98e277ae47f56632e4d663b1d4fd12ba33ea8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


