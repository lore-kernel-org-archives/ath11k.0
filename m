Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1349C021A9
	for <ath11k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHGQoHUJJ3M9GYONPJLmi/IU0ZcLFQQCbg/fH6vJgZs=; b=qDhUoITmAVh3xCtsyiluZ2pJ8c
	iEixRWSdoM8RQ3UA0XkD9PzZqRfBx+oaR1I6ClcHZP7c7fYdvn5c8h77lj2JZkqLdRoY5t/zsMYd7
	jT1JTQASdHDxJUwTkJWG1rcSSBxA9Tf1EbXEP/pGFpnHxToMc8yy5iHyxxlOPWElvECJ0qGd51+Fj
	8Ozc7fS6TDkIgYfezOiKAtylPaXciJRNTBvtmWc9Y22p+/i89hV+rqBLNrT8yCBN//QFLu56DXE2N
	0Xs7E7sX6vs0/ChkvDbjV9nI+8gjc+6p2nfi7c3NXihSwFFWxCpLFdI/Q1tLAhTqEyH7CYBbcRnyw
	l7TokZvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSS-00000004LPT-18nc;
	Tue, 11 Feb 2025 15:45:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRC-00000004LGk-317x
	for ath11k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:39 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B7U3Ms001431
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fHGQoHUJJ3M9GYONPJLmi/IU0ZcLFQQCbg/fH6vJgZs=; b=OqAoVPamUppvlOUY
	MqmRUCUgKF4o6k/e5d11M89k8ZYJICq6LYlWzks1ChwBgeEFo72YHCnQyhyR3Fzg
	gmKYstnjUCIbPYj5iT+e5YW1lBa1AtqH48j+5O+30+8vlg2B7D+oFdlsF/vElgsc
	6M7I3qrZxAqnsWM+f+vK9HWmulRTmwMZ2RonZmrm90nHyA08ZGzuthC6n+n6J6OS
	W3f3H7Po+mRuqTzhZJg+Mb+Wqkq2XjihfafrGAc+2i2gk2F5oG/x4S8eYT9wpGdi
	EMg7QD8+zRQ7hofqrvJID2sOZYDeyoiLPjQAmcec4HGGMsRxAfXOOgomMAU97Blq
	atyoLw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qepxmh6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:37 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-21f37eaef03so96507965ad.0
        for <ath11k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288676; x=1739893476;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fHGQoHUJJ3M9GYONPJLmi/IU0ZcLFQQCbg/fH6vJgZs=;
        b=rnvFx1m5UwI+uLVZ+mbtoAqFrDG1ObQslycPbKaxPsFc0zzk/BwpmXgHB91RoBc/iL
         9WWJ9/NEXMEJhc5wgoQc87iBt8csyDNnbgmRhqLuMYZ3npFfR4Yzvvbb0kSEPIYUxriQ
         1ggVgIRd6JXEC4vwUuc+xHAu2VVxHHeZGou1TTNSVDPi2c3ylN0wRAm/+7L8BQsOdmxH
         GIDI6HwZmkqQuNEHnpD/kbZydvWBzWFzaFQ64YZ+KLVnC0qHR76ab3pE/bJsF+AgUiC7
         j0ax0TL8lOSK1LYvvEte38sfD/2C0bteQCFdZJuGyaMXvOpwnL7RrRBG8RS1G8uCyw7l
         3bpw==
X-Gm-Message-State: AOJu0YyKeoC+ZKSVapAgLK2gLeD41uf7/btusuiyjhJqDW/2mOj9LWY8
	Y0bzmuW1ygPKsiCh3c9+2/8qk0VxdIKqtvHesfEZWQTLN8idyJmAZUyS2YawgH1RMapboXThlWt
	derT39lKnDRKPj1dkhuhUkeWSDGHCSOhZKFyM0ANykNfiHH0odG/XU+kXUanT5S8N7opL
X-Gm-Gg: ASbGnctWI23tQWeMlt+2dU4yMgnzVLBahoOi7jm4625N8197hg9JWWyZKhgYhVKgu6E
	mePBcSWphXnnBBmwXsZeh53QFnQ9NufW4bHUcdbSZckjbOEQinzzSLiPcTbDaCYuocZqk1BFLoQ
	gD7KNNXxur/x3NOTytmWT0D3nNJnwW0prjl3cqE8OzKlck6HVpHwcwJ3M3Y7y7hG+Vzl1/wFs6l
	DMUDMtJFDmmfx2F56K5zTMruvoW20fxeYrIum8RaQNpKJPebCikGkrBU62/lr8CkzvOyE+NLiYd
	qeMRvPxqHi/Rews47qNyP7zBJ4IWujDAqm7cTbVv7Q==
X-Received: by 2002:a17:902:ec82:b0:21f:61a5:67a5 with SMTP id d9443c01a7336-21f61a569b8mr220994125ad.42.1739288676351;
        Tue, 11 Feb 2025 07:44:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuZkvfQ9erC2HYKuju8RR1NUPF5+PChkcju26ygV2u22Mw86GTThdGbqeZaAuS/iwNJ1FJJw==
X-Received: by 2002:a17:902:ec82:b0:21f:61a5:67a5 with SMTP id d9443c01a7336-21f61a569b8mr220993805ad.42.1739288675964;
        Tue, 11 Feb 2025 07:44:35 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:35 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org, Kang Yang <quic_kangyang@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241219110531.2096-1-quic_kangyang@quicinc.com>
References: <20241219110531.2096-1-quic_kangyang@quicinc.com>
Subject: Re: [PATCH v4 0/2] wifi: ath11k: fix full monitor mode for QCN9074
Message-Id: <173928867460.1115150.6118883106228249215.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:34 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: pxHEuuWZjoBKO7ozA_6VZcV9rpCV-ZRc
X-Proofpoint-ORIG-GUID: pxHEuuWZjoBKO7ozA_6VZcV9rpCV-ZRc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 phishscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 impostorscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074438_877381_734BE086 
X-CRM114-Status: GOOD (  12.09  )
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


On Thu, 19 Dec 2024 19:05:29 +0800, Kang Yang wrote:
> Fix a warning and a bug for full monitor mode. With these two fixes,
> full monitor mode can work properly to capture packets on QCN9074.
> 
> v4: explain why change the srng definition and initialization.
> v3:
>     1. add fix tag for all patches.
>     2. typo error: occurr/occur.
>     3. delete unnecessary Unicode characters in patch #1.
> v2:
>     1. delete duplicate commit message in patch #1.
>     2. explain this fix is for QCN9074.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath11k: fix RCU stall while reaping monitor destination ring
      commit: 16c6c35c03ea73054a1f6d3302a4ce4a331b427d
[2/2] wifi: ath11k: add srng->lock for ath11k_hal_srng_* in monitor mode
      commit: 63b7af49496d0e32f7a748b6af3361ec138b1bd3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


