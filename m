Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 250AECCD183
	for <ath11k@archiver.kernel.org>; Mon,  6 Oct 2025 16:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lz799N4xrdExjbwvywVoVoJu07M1y5K/Gx4zQPeH1uo=; b=a34YRIEglo6KlDJbTGIfAshYh8
	UPGPyTXAhAWHKGp34l5RmMxb03tYpINyHOoMlo3h28LsVL1A0jz8aUtD01Zg3DgVH9Dv+sPAGtALM
	TD7oBqx45SGvGPsprbxowDzCkJhHRNtUYmOoEygqVa6W51d9wAgqP6AQfJLiI5gaj+9uyU6Bn+aIG
	KWiwoZj/RPNMtOq/hVeOl4gKv0v+xFVqnFr7xIScTPeUr6l2bz4MoC/qQ7+UIIigWAFz6+mbtWo+O
	i35Otn+BRD/7BFmKuYjM8xM8q9oFBUm54/Q0Acwy9rjfikqQ0+zCJtDpX63fntg3uzpOFVM8PZOVE
	RSK2H/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRK-00000000S1E-2lRc;
	Mon, 06 Oct 2025 16:51:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5oRI-00000000Rzs-19UD
	for ath11k@lists.infradead.org;
	Mon, 06 Oct 2025 16:51:57 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596FNpnt025473
	for <ath11k@lists.infradead.org>; Mon, 6 Oct 2025 16:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lz799N4xrdExjbwvywVoVoJu07M1y5K/Gx4zQPeH1uo=; b=OAHgZjwIMknSUrYj
	dtHQWhDmGoGqoWQvEHp8CmWqIv7V6exUTNjIF1sTD1jBW4ziZ941PkRrXp7CM+jW
	dRyGQDzS+4qDQZLDo3U1JWZJZCEG422c/EZ/Q64XpOXxKDh8Ntu3C92VTrr8y9MP
	5fstlHL+HroOqMXSNZWpieeY+c4BrjB5b4E8gdxiBc/kgUZEKLo1l6Dfaq45OEJc
	ECW3zYGol5VVZvFmEWvSrgWZERJ7DaX+oi1MA2MjIpGBuALqvTFujp/D+kpwchMu
	LgZmeI//rS0Iu4LhNmwYfIzchsqsX2Tx//nEwg5fsAOhPV7tLd+gb2SXElvM+AHE
	jzW/4g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jthpvnek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 16:51:55 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-77f2466eeb5so4792039b3a.2
        for <ath11k@lists.infradead.org>; Mon, 06 Oct 2025 09:51:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759769515; x=1760374315;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz799N4xrdExjbwvywVoVoJu07M1y5K/Gx4zQPeH1uo=;
        b=wkYgXVjf/Hkhz2itWXN01X0GSkdQWUO9QRGkbPB0xGFd+aHunw74fOWfZ36gXSLrI9
         +8xbZJuQ44H32WmI8r8Hpk2vPyW0CYohci6CaDZANTr7C/3oupg6kSJgKrsATVblNzty
         sax3gOi3h0yRagK/F2P6QdA4DAuzdVc210DcuWI4AKXvzCgh8YGc17fSUYYioRuAouta
         Cx9g3mfUHJg18z3D09wGd2ElCSZlnQMxeuxmg3UKLYHmBgceuY7XdiWgKa2YBNJKG5mE
         Y3OBJM0Coswrz3Vf4lMaY3/3aQmY5ogYZTG4xsCuRJoSuDivsLtnF1VbqFVBfPvY9Wsx
         hXjQ==
X-Gm-Message-State: AOJu0Yy4tB/ylc9dVtwnCmNQ6b2Kf1kxHbZ8Rj0+f+kEeruK8FM/QmsC
	SCr7oQ/XvFqXjjR5+hSFC5+mnfpTra9Bk7STHBgnj56CmRj+0uWiBzW3Yfc3qPmrq0dWtnGh9mT
	fiFVGHq4ojO/67oVlSNogeBqBdSwg1CU0xcCgIcV++0Zkt+puVc2HPRhHkWKOa1f6
X-Gm-Gg: ASbGncvnvj5f4Ca9eFY8f7TzvJQl+geEDQsFPKIz6ZiDGn6LbBz6cxMZjGfmHf0Qd6B
	bxfPRcdMb6Ord9muVDSln/jLZrULcDBpiv511xFRygZtRqy8dXHlg1SjNx221CviHNvMd1oNEDb
	+jrnUFGhPWcTx2nKiAqzJPsZYYmDyFSIVa3vvXai/mWeb7yAeSL9adsiR6hhUIqc/2RrdacAIeO
	KDaqEIU0NLSkpFh6ct9HnGkI7xmEYv7VBGLRHse5g0fkVm3iicKb0Lf75Kdd2bW0R4v074QQWX/
	SP/UdrCcc9dDvsDQkChWyryqlSCPeoUipPgkV47hgtrIVwohz++uyNiRz0ZsJSEh+vaA/gNKDdN
	f6U4ZDg==
X-Received: by 2002:a05:6a00:b55:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-78c98dc4e18mr11481307b3a.20.1759769515059;
        Mon, 06 Oct 2025 09:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKnTqK7utLH7t0B/x3loJRJDnLWhxeQ3OXZfJ6zNNM9+cIiFqvwHnpqLaeppi6QQA004orog==
X-Received: by 2002:a05:6a00:b55:b0:781:1f28:eadd with SMTP id d2e1a72fcca58-78c98dc4e18mr11481288b3a.20.1759769514601;
        Mon, 06 Oct 2025 09:51:54 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b0205336csm13293176b3a.45.2025.10.06.09.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 09:51:54 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath11k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
In-Reply-To: <20251003092158.1080637-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20251003092158.1080637-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath11k: avoid bit operation on key
 flags
Message-Id: <175976951398.3451922.5845347165162023297.b4-ty@oss.qualcomm.com>
Date: Mon, 06 Oct 2025 09:51:53 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: 9KdJluas7IMrVE1ARTgDIiCwjAzSJDqe
X-Authority-Analysis: v=2.4 cv=N5gk1m9B c=1 sm=1 tr=0 ts=68e3f3ab cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=r6rug0q3oUuyHVY6sCAA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNiBTYWx0ZWRfX9rwzwQCW/2K/
 D6j7SqJmjByySp5nMd96cmRgZliDp1KoOEzS85ddsRiQcz+VNnkx9MsFz5oE2pu6Be+W00t+bea
 VHqbet+jwuZnEH3CBvPbhcRmU/6KPLIYsgLSzNG9yfaZE55IeLPlrUAC5bqFHxPAFkFGektrpQ0
 d4MVJxwihO5879XYX8mjk05Hr2+UGUMaqq+1gTSH0bLpmZa84h/T4XKp1v+jts8I8uJ6Yt1qlhv
 d6LprEWyJIp7jsibPUexhlMgqoslickdlUNyBc8p/X1+W5BNCW4x6htmUE5JbjidQKTHXi3R4JY
 beiCBc6IV26rk0dJ/M772dGfrevNGFEvwFdNA+ICo0gYgFGBVswSg0aDVSFflNlrTk/tB11cvBs
 Gp9QJQVqZ5ADme8HTBGXiEssbXOX8w==
X-Proofpoint-ORIG-GUID: 9KdJluas7IMrVE1ARTgDIiCwjAzSJDqe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2510040016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_095156_322447_6637C2A0 
X-CRM114-Status: GOOD (  10.39  )
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


On Fri, 03 Oct 2025 14:51:58 +0530, Rameshkumar Sundaram wrote:
> Bitwise operations with WMI_KEY_PAIRWISE (defined as 0) are ineffective
> and misleading. This results in pairwise key validations added in
> commit 97acb0259cc9 ("wifi: ath11k: fix group data packet drops
> during rekey") to always evaluate false and clear key commands for
> pairwise keys are not honored.
> 
> Since firmware supports overwriting the new key without explicitly
> clearing the previous one, there is no visible impact currently.
> However, to restore consistency with the previous behavior and improve
> clarity, replace bitwise operations with direct assignments and
> comparisons for key flags.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath11k: avoid bit operation on key flags
      commit: 9c78e747dd4fee6c36fcc926212e20032055cf9d

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


