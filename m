Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E072C83013
	for <ath11k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=; b=2kh9i2OqD5PZgOBvtJGLlCmyKp
	rkC7pG7379/xyQ5u8uLBqVawsgXPg1AmhqutTZfMzLGBIaTQ+iWH31Tq+G/MKyu2Crhhr1f20X0Qk
	FhjOr7MF7enuQac4/FOONqHR4XcJn8OvpQBSaSoEU9J8mBluguA+6IOKu3l6bh6O3ggTD7TclViZW
	vZ3qcb17EbRJlmc2ioh5VFyWuiRwIY+iR6uvehL1ECr8+WIJNaiQTwbTVGaUxZlubFPDqmO4vdXgq
	qoY1vHS5nN85+lOofm+m0Rz4nm1lFy5dgl3OBODVL+AUsBX/WOtQtnk5rpdx4tVOi/Bsb7KBmIH36
	50J3syHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuU-0000000DCST-3Kf9;
	Fri, 27 Jun 2025 00:25:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoX-0000000D238-2VVJ
	for ath11k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QKGK2l015352
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=; b=lDs/csn37OXesSg1
	qhfHsdcd5nbgCJF68KCe+38WJTCDJGc4Eh5+NoRNxHK6myX4NyjPIHwx1eCwr7a6
	UKo4xFk8XLd/jeu8jIv1Rn9xaaIQ/rTUZ4CdVapfQAsUdxnfVc2oNJ8iq5RkW6sK
	fX6YZUhGDd9KCTgt1NcscjTwsFaPdoWLhGxTg5D8rYMxi2zII8nQIpi7YWq2MO9d
	d/2p/YaNMnKfGtaeVvoQyeO6C/Nn1MSl9hT5KY6kglrnlNVkeN/uytEBkSDZtpt7
	85NEsyirFOGP5VENZyugZl/7A5QTbRTqcpdudm0B8gg/kIjGGw1x14awKil2Wd4p
	U5TCXw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fejur-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-234fedd3e51so14887775ad.1
        for <ath11k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979714; x=1751584514;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CGRflJ6B20MP/aDBbwjQX1TOBeRFLX+9ncIFL8m8u8=;
        b=hH6fXXcxVInq1HdEjHGhK7X1H1zgvYxPbrHn3pICzODpixm8B/O/Ibh4ai8R+zBEXU
         KG/ilbLJUxOt0IOUqwXNT5P+Z29XX11LmWv2OO0txa1TOOcpramXgZbHlVY/ItBojIrf
         MkVXAPAgMJ1D4YGxG9VMqp++ZX6mYQuvKq0OJvxvrsRHN/PwsWeR2cpD8mzA2udsi3of
         Wlz1RxNxcmhaxBGA0OA3d1oKozE5i+OsRE3BcTS6tribrniHc4dGEgGCQCnTR3yWk21k
         EN5BODTXsGze++s8TQYaLEUnolbI9IHN+jCPMbwhtq6mG11rjr6C4d2Ss5pz2B0Zh+YL
         wOXg==
X-Forwarded-Encrypted: i=1; AJvYcCV2m1kuH40esNSvRZgqjUP8VVTXK821AdCN8GKYe5QSTLv3apn+xQcReVqyiAg2LePbkdrPNAo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEzXqcc7weedkJW1v86zMN+n64X7OuEbq2iz7oXhPGtBHOWAnl
	6iymjHg+1N34KUqFKMbZ07BIL7TKak2Ake4xlswvB4RTfQIkKlmS22HNmLgm+nNy5GJ9fHQ+CKl
	HzvHSqAlSYK1pl11GvViz30DpsrEaydiHm85/Xn7gDja1HCLbMwhXdnu3CLxFKOJsm2Cpb/dA
X-Gm-Gg: ASbGnctoSJq/P0qUZKSVtcYJd0+FCMuqDm/lg3D0HYihRsT0elgGqb0AieIn0UTUkwd
	29zeFFmmBCw6xZt9rV3MTnhNAuJm7k9pS155G2BYvCnj0E9l3sZi8I2TOtwYFeSivkWohDC5w7j
	NOwaeZO+HIaGEaWTgePMDUzrsrcKteaIHpCnLryUnmp10qA1WulYZOLW3+uTUcsBNyMSnuZSMLc
	9alGve3Z1OBlEmRkwCFsTlaapzl8oy7hpWgT6bwwGe2+Hi5aJHcEbQ1DHu78hBZIlpuDLho2Lyg
	Ki9rFHD4iRl1yH+MdKDtUK8+j/vnJASpySBAQDdZjRjIhtkRqwX7ezQ2dYY=
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15454215ad.27.1750979714464;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHatQQA1mUCt08p8uWEuxkLDupGYZtc8mgpT1E0dO05P3u6qH6lqBdVuZv79lzu/hrCr1rIEA==
X-Received: by 2002:a17:902:e807:b0:234:bca7:2926 with SMTP id d9443c01a7336-23ac4605990mr15453875ad.27.1750979714115;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:13 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250619082010.1834109-1-colin.i.king@gmail.com>
References: <20250619082010.1834109-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] wifi: ath11k: Make read-only const array svc_id
 static const
Message-Id: <175097971319.153431.8225006080279921985.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:13 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfXyHKbffD0QgrF
 U4eJsVLyfLUbHSZ826NCRVTxoTzQWHDjpIG2AmpHrHhJqqxQlmfYDvljELKQPHlWikNBNMwmHev
 F9Qfwj2TRCenoqv5A0lJKP3zxZJ0BpxcSeTv0DteZSk6N1tdfYHunhuqMzZuHHTStfs7yOtGGH3
 PM0YVcaw63zYdIrhtX76pS6Fwc9YQLpXBqMdNgHCo1EsovYOVbGAy5bs6jvCSGgkl7fWyez1KxP
 l8D1w/AD/5+qiKGZXgKxMIMWP7oICAGITb2YOTQhOn/4Zet6WR3dvnpNdyhPs9wyAgYi2450AAr
 ifxdCtFuDZ4kke09Ziu3SRm80gYSmet41E0eHGChQh6NML4loDO+NhGY7Zbf5m7Dv4HsCBlV+uR
 Z9Arf9MRWlC/9eBD2FWwfGxv5EbcbxdgAX92c9aCdyJx31qX9Wh1Xq+TPotUGZ19RiV5/yc2
X-Proofpoint-ORIG-GUID: MhYdb9pB7YRgaSfbbU-MqRSfWpUP3DVD
X-Proofpoint-GUID: MhYdb9pB7YRgaSfbbU-MqRSfWpUP3DVD
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685dd490 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=TBCri2Webv1PiB2955kA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=939
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161529_757587_4DA4C593 
X-CRM114-Status: UNSURE (   7.29  )
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


On Thu, 19 Jun 2025 09:20:10 +0100, Colin Ian King wrote:
> Don't populate the read-only array svc_id on the stack at run time,
> instead make it static const.
> 
> 

Applied, thanks!

[1/1] wifi: ath11k: Make read-only const array svc_id static const
      commit: d8f07889e920493845fd628407ff0debbe96fa09

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


