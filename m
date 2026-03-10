Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF5CFCC9A4
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=; b=o1ycfBQ1wKlc7ESL5AGSq3g9yW
	RH5ISPNJ2GMp6uvNafULWylowk6j8ZgY7Fg4LgHxdOVxIBHjaVA6+uglmsqLLdbbgUqo5CWSwg7VE
	t/beMSCAF/jxlRYDRKIgaAuL6IA2RYW3F3Ssnu9l3bf/ttk1ktkvMjPjPzGzH+6/B/rZjRZjTTogL
	ZR9OZ6IikU945acl4WZNMx6XTL707Xm5HOLWyLEzHUuYEBQHeeUEwmE8+2M3JZD9zpDfXL2vZkFul
	xdMGFeMRRrClWjrQdy4EAzkS+NYraNPNg1ZTzTWePDoWz8wXOUH7kCahdGoOBq1nD+im4qC672RBD
	oF4KdUJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcT-00000008NTj-1EQ9;
	Tue, 10 Mar 2026 00:06:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcQ-00000008NTK-1Lh4
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HC7CD1298301
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Hhzas3m6jtpCWQCVIcrAsr4W
	EI6JkmKF0k2Y62ZMW8M=; b=RH3i+5HmDrcWtIsbYsGLYPAucQJ49p5jSFCP1XK8
	cmD1TTszcORCF20BgNAuXaMv/jJiLRErS8OSN8QmqlCTHyPy1z+QkEdtxohyjYG7
	A2mADZnPK9mA9JpXvpYpZGSIN7dK+BD6vZgH+2IvNkfpcXulgdym5sqCTauzjtkf
	vtuiyUTc65s3tMmjbV0vaKA2UBoopnEDP+Wh4kABNLM7l2sm0CNYv97yvtbjRe+8
	S+oMT8HwInm2qtDIf1ZRhXBmNqquWgIRW4C+P3hXW2N0zjD2euQ9JQXbhB2aEC63
	TEvjc5oqXJ7b/UHtcEB1uZLhcWij+XqY/Bv4WDu7ADTmvA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csyv19tj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd7f6ac239so1270063285a.2
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101197; x=1773705997; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=XyDmTpyAVjfPz35bZL5Nqrddy8FMQOybneqPqjKtlVKuxTwhmrH1YYExLSNzp9aejK
         zZNBxfMA5ZrMYrV4IMFewpu/HqQHRfIj97/qh8Eh0XiejqYtagcrYj9Nnnnpf0Gp2KFg
         Jh5I5FJampPMPhZOMIsh3FqFBsKdNi2ISmMGk6u6H8xiVEGrUntybIT79j8rszoVnZ/p
         yXEBpWNT0u2pFkbrOA+rg/fT/spjDXAS54ADc7Wjr7HUPoGx8sRn/wSRepbjq7QTfH+7
         2jYt1qD/H48hHiCb5+jBKxV0R34hiCkhHxLx/+jqx0j+ErlMngFSpB3pLGKNuUg81yju
         0lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101197; x=1773705997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hhzas3m6jtpCWQCVIcrAsr4WEI6JkmKF0k2Y62ZMW8M=;
        b=HwMmNKwMgQdru7sjRuRw9Rj4A4C35bEZ2bPD+IUr1i7rTWxXfRCGNZsn25TpCowLaB
         L44NpTNtCKDF4pHqgxQz0Z3UcrY7SOV6U/yeKAY37b2dMiLJvHx8CR2dVw6PYYcM1iyx
         c4t8DF06qx2g34th8g7yN8ZOAKPUHDDDsOJT5Gb/LdjmAkmf9lgtGmv61BJmbOORvzSy
         Q8Cp0i55srHALs9/PtR4E9j4siUKVLDzP8Pyo3zDvb8HpSKuolJmhjtwLDmFkmoJp8nX
         n6C2Vt9RvqfPK/zFaD4WLyxkKrX9FGGG55By9D9rtPBAbvQBYPt/py4f2C5/Eds8b/mF
         GidQ==
X-Forwarded-Encrypted: i=1; AJvYcCXb4kGRgJ7Fau9qCgdwD41ZrDlKGYGhdLbrDGXM09Qfth7xgFaeDv8TCnFxAw8t0vK/32t6bzQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwS3XNu+Xgwo5b+DpGEoGibfIGrSc21wKlHu57PrBHX7sx8uASj
	1k2sQgteg+A38UTwoR18Mpahzv5EMtvO9vaBmQEWEnb4E9hv9bFz/gSf2D8Q8toDxyXINvXfbEt
	tNsJeCAWyYN3tL40LQAMWhINcvdfAMzKnaVVbcFtsHl2YHWhEQVj8VVReiLM4+77E
X-Gm-Gg: ATEYQzz1yvL2Zz0Lf9p3P7LqlnWjYIn9GuyvDmBMq/XjyWFSEmPp5Lb1ylA7KDblsRH
	e4LZjGBHJQyun0cQ6Q1dHabEP7N1VoTHJai8dZpR+h+zLB97+Ya0ucOm/dzkt9fEtWkLbpAatmY
	2nOAxz0ia2GA/42+tyHUBI9QW0pcK6RuL2xPhGVJRPRomjpmV9FKmzrAoHoUcb46pwt+dTJxhIS
	qMwnu2iXVr+i82MLqLPCikycOcPxoLOuP1M3Moi/2wAOIJ7lrwCHc1HlcYN5zeHPmX4yC9GqMC/
	d5sJMqXIMpQwXFknQBk04CjOR4YcyTI2qjbL0nYnnJ2Wl9CDjxiyGLLmGh9/o+k76mjC5k4bM0X
	EL1JjNWUlabpT4lNTzNRk/lBdjR5P6pAS4F+5+1l37fWmQyXnmF1pW6vh6ptE2qC99DPfTRQUCY
	eLka+CUfal7xBSB/a8D+hm6FUPwmQ0WuylovY=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491597385a.78.1773101196851;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491592585a.78.1773101196256;
        Mon, 09 Mar 2026 17:06:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08d269sm2464700e87.84.2026.03.09.17.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:34 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:33 +0200
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
Subject: Re: [PATCH v1 5/8] slimbus: qcom-ngd-ctrl: Use the unified QMI
 service ID instead of defining it locally
Message-ID: <6dvg5nev7sbqyfhmzgw3oln7hb4b4jlw2yhrskrcibdscoziox@hir4jpjcrzey>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-6-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: rxXILSVaK7S6FLiHjZRfdS0Z-gvHB8zX
X-Proofpoint-ORIG-GUID: rxXILSVaK7S6FLiHjZRfdS0Z-gvHB8zX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX4R6t+Dp4bfZE
 ETcxZ81ni/7txyj5vPsxPP5n/k6RiWQHPaFDXF10XhEYrLvNXwgrptiTQHQu9kndQUurKesUYTz
 La7CZCNvVmhOVwAD6G4h8amKlsbOi8mplDetm3owtL/V3zc92jRaaEn7T8NYA7VRsoRj8L0YBah
 EpSB5pptXxrQ4w3bwHvMIXvY1GuY+gkN1qtCz9Y42AKM5GV+SiceUr6ITECHGt/Sah2ag+sN5xN
 sfWvlF0hu/2EscT3S97cpA+q/3ONwOHXXRUqwVtDebyMKDZOm35WDQdtMOC3zeifbk71dW60xEc
 n/NlsuwyugzFlfmpt6NsH5SxXHOQOT0LqrhBu2INjMYdp6fTmjZH8A7xxGV4a/y4vFJY/5tZ+6B
 O+JqabB5HrQeL/L0y87XbXVFFkw/Fnuukc/ICMjWYnVM8Mx1lvsnYDdq5dmNkuYsgXe234R0IFk
 d9pPPfD78EXePf8pwAg==
X-Authority-Analysis: v=2.4 cv=Cuays34D c=1 sm=1 tr=0 ts=69af608d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ho3SWJPnPTLIVTUpvTwA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_170638_386074_B8942905 
X-CRM114-Status: GOOD (  14.46  )
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

On Tue, Mar 10, 2026 at 12:03:34AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/slimbus/qcom-ngd-ctrl.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

