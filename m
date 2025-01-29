Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF61CC0218D
	for <ath11k@archiver.kernel.org>; Wed, 29 Jan 2025 17:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CAK5AYU2DDiO34LL96EmarD63aQQ31iXDXG5ZFzJuwE=; b=KYTUIgsjDUMl4MK7rch2wqlzpK
	8ZqZrg390hgbl96RcxmmvdY8gA/8ELBNesL5u8u4bXIH/cDhHQtd9rd4Sw5S6Vy1H/j/CQtia5w+A
	iJiWOBuHGUcqrSqDsKXtlv4stEMJgcojRcnjElM/5CZvQKjs8M7ouI5Mx7ipav2U5wuc6Q4iNZ4NY
	Yw0WOVMhg2VYZMVnoDhh/+n/S9pUL69pe+mfX1xFHnZ4MfeTk6ee/MFR/alREnMkRKc2ndBYc27G1
	P8IacOu+o1vJfWRtVbZLnvoobzhFJJG9vYzLk2YuWUd3oKzsTcwlkWcrtPH2CTy2Iji2j0vnYpgY7
	6M0FBnhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBTu-00000007S1l-2rl6;
	Wed, 29 Jan 2025 17:04:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBTt-00000007S0t-03J5
	for ath11k@lists.infradead.org;
	Wed, 29 Jan 2025 17:04:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50TGrsRD013771
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 17:03:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CAK5AYU2DDiO34LL96EmarD63aQQ31iXDXG5ZFzJuwE=; b=ZlurnVUudc0Zqe8j
	c8uwC77wvubduvQ1oYYqpXVOTNBifmsCFZNFbwhjbcrwsVXZcaiepmWuA3tDiHdE
	Q+/4ncDqehEnBsRCyzaEmb9vPe6ngeh9kQoLf6nvh0gTAVjNwBtYpCBz5S/Qs3x7
	noFw7OgY8fs8q1R0JL079Xcoc+e68yOSnV0rQF8CmprNcWVjxkxVWZybtiqXUhLQ
	finVU1/C5WBEhGaTRL3UNBZfhQbt8H7jnO3XgytASXz4+eXSr6S7yj/8RBTMEd/J
	Z1vgsvNIox/u+3B7yiodvoL9ku6afkeHsOODOQccX3j3wca5R5mHpuTuvnx07mpF
	RfEGBg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44fr8kg0tf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 17:03:59 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2ef35de8901so13094441a91.3
        for <ath11k@lists.infradead.org>; Wed, 29 Jan 2025 09:03:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738170238; x=1738775038;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CAK5AYU2DDiO34LL96EmarD63aQQ31iXDXG5ZFzJuwE=;
        b=LfyrhdmdKeK/mnEO4Tm2C1Xdh/Xa3Jj8JbzzbsEY9FJ303LNWwBwVjQ3pgQ0e5aqHl
         +ll5uulrpHUJYoGylErz/o6UsgMjTudyPOwBundjbuOaLx95if9tXNZZ4rnDFhEakFbj
         0MpBDGt97rHYhpjhHHjbbJKYMB4TrRuJilr9AI/y1nzOAp843VhshUJ/3hpiI+e4EAfD
         bl5s7bj9I9zmrUUjgWlHk8wl3YONmJG4Vj14gMXgPHbTzRRGW5NNHvdLwcEVFW6ZQPzF
         UCwDdQTH8+rLftoGVx57sJj+9LfteOMY8lhUHLWUKaIwKVJZEb9XABgG7HlGgBWL3Mqg
         cA0A==
X-Gm-Message-State: AOJu0YwDFcZMJdulbUz3aF2XN+Alt56DHh6m7G274nX0aJPyYjGRULgd
	Uo6Q73A7WjOdeFDNAIDudh/q4QvAc9CeB49IYlzm7GWONdRw5kOviV2CtteFAlWN1P1IzbgGAtp
	TXARjq9aA+x3cVwODguOfb8KllDk3fjuT1vHe0IzNLlhD7yPVcra40/Wt0bBr
X-Gm-Gg: ASbGnctCs8umbffwkk3EkJMFDfMEVBNYf42JaPj01mFSS9VXgxU9V50Q6fEaDPj5Z9p
	39mY+vUIRyfieQDAvQV2y+oVplHy+MhHMqdmsDQu6UL6W+5pbJr5+4w/Gw5mppS9Qaxu9dWPNj1
	RXOxwlcuwOqlNxF+iufuzhFW7PH0g/rkdkbahDFYjol1RdS3lg4wPaBk3dSgquPGO1vJH/RVD94
	IHNpdsde0oeOBhdbDqeGH6HcW6M8W5wqr4VDHHW5XIdnD7J51rebP0szGUZcFpbQP9KfI86/vdI
	nLQq4rEtTXoYg4u7vK6EJBHivqhZLTMx3Th5ZWBncw==
X-Received: by 2002:a17:90b:280c:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2f83abb8dd5mr6017608a91.11.1738170238411;
        Wed, 29 Jan 2025 09:03:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg6cb6j47+6W/XghU3MY/1geDUu11NiKBdSmfkh2S7dK3AUQGJDRMumaRzJ36rF68pka8dPA==
X-Received: by 2002:a17:90b:280c:b0:2ee:741c:e9f4 with SMTP id 98e67ed59e1d1-2f83abb8dd5mr6017578a91.11.1738170238078;
        Wed, 29 Jan 2025 09:03:58 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83be3622bsm1988366a91.46.2025.01.29.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 09:03:57 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Nicolas Escande <nico.escande@gmail.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250117181953.3375273-1-nico.escande@gmail.com>
References: <20250117181953.3375273-1-nico.escande@gmail.com>
Subject: Re: [PATCH] wifi: ath11k: remove peer extra rssi update
Message-Id: <173817023736.726123.12379675127279342671.b4-ty@oss.qualcomm.com>
Date: Wed, 29 Jan 2025 09:03:57 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: j0lrhICx7tYlXYYlbmKIf6kdPvVRHNtU
X-Proofpoint-GUID: j0lrhICx7tYlXYYlbmKIf6kdPvVRHNtU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_03,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 lowpriorityscore=0 mlxlogscore=807
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501290136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_090401_176129_1939A960 
X-CRM114-Status: UNSURE (   9.87  )
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


On Fri, 17 Jan 2025 19:19:53 +0100, Nicolas Escande wrote:
> Commit b205ce4c266c (ath11k: support avg signal in station dump) added an
> extra assignment of arsta->rssi_comb in ath11k_dp_rx_update_peer_stats
> when it added the average rssi support. So lets keeps only one by removing
> the legacy assignment so the two statements about rssi stay next to each
> other. Compile tested only.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: remove peer extra rssi update
      commit: bee577165a0a375a1d47d8ddef1c321e0f7dd6c8

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


