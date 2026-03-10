Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1FCFCC9A4
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=f2X9TxHkJl1LwHiGHlfr8Sg7iU
	LAhUjx1IQbQTe05m+w5fcmlDWqOfp3bIfRmbwlI0A5S4jCvfVqgoF0XjC8MlDT1JbF7etH0iaa3qm
	OxHW7FEJ5BPCZA2dsuTmqLsU5E3UAfUU+y9CGxPCBjqc05fblr1ZHekbCVommoEKeBkXM3GRUytr3
	Oq3AGX+eLcggdGyQ/iOi5cEIyixWFeHiWEOoG7ti8dT+bS4gPNeovo+p0VXsYm3iTiGa5M0x1XPWq
	H8f4YHUMUQ3BJY2JfCCu/UVR3MJpnGkJwhC2ngUwM1xjShIB1f3r/fJDusKpWtAs9pjpkXPgRUd/C
	geR9vN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbH-00000008Mzc-2wgJ;
	Tue, 10 Mar 2026 00:05:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbG-00000008Myp-1yJT
	for ath11k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=; b=c0GIdJVLflfjPgMuR/PexqAS11
	Sx65bSbuwKm5dOJ91fOZpf3v3Q+jDZfwBm58lOIzwJRSOQ6ilDH3kkpjZnbn/RORE8Bg/GmPTaJBb
	T/i10MJkDTS7nu7/RQ4/N2iFDx6f83D6dKZMJBgJ4O2soRYPNSmFbz4jPcfvnA1uoAdyqpEkqW70S
	9c2Gkx7mkQ+qihOr6rSgT5qLXTe05i7mEMUE/bcDBHQ6lPZ7OpZ5lNGktlAuDO4Wr0Bl4PNsiBklF
	cIx1VKGQU3S0fWQN8GqhALTPi/BQlazfWTmed+mVzod/7yz20fK2A5k1Yrt8I8rdZUtZnzYTAey3d
	CpVx0d8Q==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbB-0000000DNOp-38ED
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:05:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBs3a859826
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eq3YR8SJMJVvMJ+9JHxKSwsU
	I6gefV1Keb8jWt7Lh3M=; b=Vr9LnGwXIh56NKbRnXZ9oGqugFUK4IhcHRzvq3a5
	Un6ZQ8s8T1noY+p3OJ7nIlI/pFkfv3cYoEM4U7/xltLCa4Z/F2sl289yNUEOLOBa
	Z3BMufsHHwruxHaeqjTrfm6GUyvtFJbg8+zVVlRX1F67+pZN2/f57ytt82EYhETZ
	OewgGpdBKuqvpKxd0OIc6KSPJV+25un2J5yp3XmPiFYJMQ+y92q1SsXDbwt6Jmi2
	8hHVAJIACjd7Y1J5B9g55NXaSqTp8r6jKNbRIKYDA86kvmEp8GZBpLP2wJWX4hO2
	SEac3DT7Y/5jRBWsKq2SbbWyH2StPJI5fzOoVYyq7M6BDA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyhbsss1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd7a25c5a9so1229146185a.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101117; x=1773705917; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=evwmnmQ8gqLiHw43843oJD3rCrveMSFFH5GyNAUY8jipZmIRZinB73CxJDRF42ENy5
         uPDyiFzwCY4h3LQoeMzm9sOLXHxYEppCWxMBSPoVuPomaf1JnDXdv0qAg3u+DiUlvVdY
         QStwEuHO24wBqozBK7A6tzdrZkzgD8PFqdtHtnZqFEOPYWRF3gCNiVP/lkXNZ7+w23U2
         0dRVXok+42egrLMP9BWLtNbuXZJd8FrFGt67FVwALbssJF6vFPo93nBQ56vjmPRJ5+RK
         GAFSwV1zUqEOHZmqg9onMLnzfpe9gbYm5NMNG2PyoAU2H+MlQkhdSL4Gg01yysezOjNU
         Mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101117; x=1773705917;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eq3YR8SJMJVvMJ+9JHxKSwsUI6gefV1Keb8jWt7Lh3M=;
        b=CCKacbHyhD+PgCpOh1fIr7ulEqyv23KaIKbU6i2zsjiZcT6ifFK5KH0esEHYsh2Bz7
         XR74EdiZZG/t453M31vyJlN1Qt4bsRmNIL4tTo5EQ12JKHQmtfabt4nXKkDJxI4Ktsno
         judvV16XzbA/czoJ8UUEqSXxaHQooPjmuOn95Rp4mN6hzoryNYPqZmmVSJE0J/0U30E8
         bJlvX5RQWwUt7c/7uKDCWs7QBmfVTzUE7qYDP8Aqyk0UIoMhL+wUrnl3dOCy7AYRDHkL
         vjcSWvdXwhmar6LXeONJu+ey+HVhjcD7z7ISTZRolpRwwTaXFYROvOM6fdd1BrNkco1v
         3nYw==
X-Forwarded-Encrypted: i=1; AJvYcCU945k6eVrOce5ll21ZKXFkgH+EFACjaYmZPqPFMbuLd6LDj5KgogC7izQ/+OWcBAPyZMNbWBs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1LlZtN5eIoVHbyaNs9szlL9lMbGuS/NtvQnDlKqjFzlb0CuBa
	JqXYHVKpRjeiUtphFuA7z0A9sNpBnGrLxcQEHH+R9YKgQ/jnHPVYZPRQMt6RUJB+gGdZudHnkJP
	ohsgfjqsS23smZEN/sv25ZXlLmGnenJP4sEeiHpzklVfCFY+lgZ9tGqOsCnhTbFyq
X-Gm-Gg: ATEYQzxYDjcwJPs2QatDW1zNYf+4UgAT5uhsWZ2OxtcBhsQ7LRPpPsfgIQyYLT7jAAf
	xQ/lQj5kziK6XssN2hBpS/vNmH2jKbiPM6lFweBvYF3Tk3UmMi8dWmhlOZgCmRRGa+3TSp19wQh
	VXcBL01OMNgHy6TWeNb2xki2tZEzjhGS/I8Dv4VE9S8/QmM3mYihbeP363Nl8kXJZR3/ncGXKOm
	Um+GmcjYQ05RQO/Nv5RadPOvnb3hYyxZCQQEZrNSu2sB0HBqjYCmfm/2rGszFMa1qK6TcO2um6V
	J8quk3ed101KPDQ5T8jhZk+a+pF3QY3SQZ6tMU+CX/9+iE9GCucyPHxmXNlGkCfRr65Sgrv3NYe
	ov/5tRymCHE7NSPY+tWbuJjinDJr9aaMDIau4pYDk7du9FOfZD8i4YIsBvVpbx87z3a1ot/CVHB
	lqUb4zL7BA4Ynua+NlMay1Fdyp4il8lOBO7TY=
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601781985a.39.1773101116983;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
X-Received: by 2002:a05:620a:1901:b0:8ca:2e36:18b0 with SMTP id af79cd13be357-8cd6d4d5b1cmr1601779485a.39.1773101116549;
        Mon, 09 Mar 2026 17:05:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d01cf6fsm2324914e87.11.2026.03.09.17.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:15 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org, linux-kernel@vger.kernel.org,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org
Subject: Re: [PATCH v1 3/8] net: drivers: wireless: ath: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6mm6z62o6xlso7mxyelx5zho5iowh5zfa4tlbfsexrb6vohzjl@citw4jcjsgsn>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-4-daniel.lezcano@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Rcmdyltv c=1 sm=1 tr=0 ts=69af603d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=n3fwWfvLsPu2TWPVUDwA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4Wf03Uos/hnY
 gx/JHq+IQnJrR8GY+eQk4btLsjBt54S9YmYUu0w1pEb4usa8RXI49vyhqCx9JJ1QxG7cx3w+NOz
 Ju0IYDaJFc6/lnTgkchPU2KMIEx7vzn+Jw6RNXGW3IE1QdJYBpjTEYZI9TlILjAi2EMZ/O3Iffh
 X8zyx/VOi0buh1GJ46cnNkBvVIzlbsyRwWm5IGwLV6ATLxP4/4MzqcFFswK6DIcbLN8Hdhh8yfE
 ztgFKKWxfLr001WiNkM4vp3hFK/eR6JhC1/4FMqNPWpwidK2KXeS5iEeQz2FWXBXxvljtORXyqY
 YAH5aCqV/4asBTxdX0x//3FIBMfBaY0960WgK7MaJQw5A/XoBb8f+QVpyDBo8U/FLGjSabCmf/O
 ngKCbCYdUiJykq2w//RlDI/vZRck1Oeem5+/bo5BLfTijef9rZyixQOiW3JzdeIpvc+LC4Pi4UE
 QtXHDRYr8ethfwXnYUg==
X-Proofpoint-GUID: eur0XoCl52qMBpf37WXboLF1kaUo7qY6
X-Proofpoint-ORIG-GUID: eur0XoCl52qMBpf37WXboLF1kaUo7qY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000522_556157_35F15F7A 
X-CRM114-Status: GOOD (  15.40  )
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

On Tue, Mar 10, 2026 at 12:03:32AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath10k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h | 1 -
>  drivers/net/wireless/ath/ath11k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath11k/qmi.h          | 1 -
>  drivers/net/wireless/ath/ath12k/qmi.c          | 2 +-
>  drivers/net/wireless/ath/ath12k/qmi.h          | 1 -
>  6 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

