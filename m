Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0539EFCC9A2
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=; b=Sqpuk/y17RTJE2Y5AhenlzJ9je
	DfpV8u/W08unGr/PUA9Bsi8ZvqZPNaiEdgT1O76HRtyElKVedJ5QMQe0QuamJslfe8IkhekjMtavM
	GT2zvASEg6anCFZ7IDnizTBSzo/op91FV/uxwr1rzmx40AIm3B8APGAu2xngQADe5doq/w7Cn51rM
	f5gwsNDXrJAu9Xgf+coOUGjL/QbQz7v/NMfKFGa27LRmF9A+K5S5KwbFosKqmwWj0F83Q4YlAFNCg
	MSkJvEV0NUBUWwgQ6S0uliHnssZFxH6d+1maPITHfhL9nm+e7HQc+NKb6fnVP7IWaokV5Vi05X/KO
	/NvrqVCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcd-00000008NYq-2so7;
	Tue, 10 Mar 2026 00:06:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkcb-00000008NXC-1u5i
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:06:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBq5K1203558
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VFmhFycj2WExrdRTfkSysTZd
	dOqHarJ5plPefogYPpg=; b=JapuiHfLWZPy7Qf1nLM6DfJ2elKq7wWA9Yz5rN8O
	RpcjqtxbVZQzPTeEaWzhCzJvIQB9NqUTVZPR0OLNID2rxrhJ9m0OKBhLQdtt+uQB
	yuFo+H1vhdnVA9t6TKi/gGnCrozq5gKa6R4+3bReYtOAad9u/0n8Jo8QPHo7xI8D
	cCt/YeY2P7veEZ7jG7qhD9+DzYDBeo0J0H2ZHl7U+XfV0as0rPy10njp4OBO5Vhz
	yGlYbJ/CR7EkMmFIcuI0Ai5YHFdPRfqBxlTo6PghMlnTWcANCodJh/75Qk/GjMov
	kGUR7kIDRhzZa9CTzNtrE8raj+VEE+v7OFR4E0kTo741+Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct0329smj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:06:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd77e5e187so1462722385a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101208; x=1773706008; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=Vneyu+Yc9O9E6gVfEWX1/6Fg4hHjQe+X8SSm5R+rGkJA+ffIyVW64zKKk7KdSdPTzZ
         G5SNARGt17AaMn8tMbCKLhW7D/kXK4lLkNHi+agfDCzTXruPI8kUxuXLx7fZ0UvUlubv
         9EtAdnkSB8qMs9AqJ2HqTm8Og0TqntNWSHjnA1FsPgHrlnmOZCpFBGt1g8Qmqdh2DL56
         uTUwGoHs6fO/hnx2uudDWqCBso9z9hDx7aar2IJI4RnZxXm4FSi9LF2sNOiZbYr5w3kw
         LQeQCRimFenS8l8UeHc6KW8JivBNYbVrnjlzEbMY/yZmZPW1V3Ji3OY/BawSgVgd+bMf
         ZACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101208; x=1773706008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFmhFycj2WExrdRTfkSysTZddOqHarJ5plPefogYPpg=;
        b=P/fx+QPMFOjq30ZWZ3745/jpXp0Re6xkRtEctRXtj7JON/OeJYDzs5iwzp6w8GOes7
         e4q/JmGBkwKOcwHurSqTtY4RwzIGWKWqCxl/OvvNhLHBupaTKY1Qe5iTwfCEVoE68gDb
         8kX4rO9QmVzns8/Gsejvpfg20fUygz2m9q/viWy+kuvoHH+Tl2rlnEcCSSovf61U9uuC
         KlGSgUG3ef+wBcdlMkvtcGu0fu1gHr18RvJI2f1pNs2LjLkso4ItlQ6zCnfm9GrACiva
         Dpt9AqE3PdJXghWxLYUcPcS0IGr9JhScIZyKB7V9h0Lm7ZYRbaA2x9DrIFg7njBP2gG5
         80zw==
X-Forwarded-Encrypted: i=1; AJvYcCV6Ty+/8+cYtVEMRMipSXFFA6EBuCNHU7GN15mrJSZ2mHjXWEQ4y8gSaRuVgJfapnjkBOStpc8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyojeucyDSDyMPf6Lf7cZQLL0bJY9z3Z0WM6O/LShu3bBElf6Ei
	Ksd7w2Ws5cMD7E5t2/EJ8Jl44FneXh6s1NtyYSW+CULD543YdTitfs0Ak0vTNkvC1cqfCQj/mQY
	PXkjRZkIcDiTayNl2S1sqWCoFHC8+fkS7cDhTGhkFEf1e3QvMZkFK7J5DsLy6wqwf
X-Gm-Gg: ATEYQzwDT0M6UOVEwPTIOF9EiRGxAPZckbrBaNooz5FNfOFAW0lsWL0hEg6e4gdpn4v
	8ik4TbUuFzcJp9ZmYmZhuS8PRvRyEVbRdh1YXvAqaRkH8GfGsxsgV26i24C5juPqeho7YOs66fN
	iMwCL6Y8UMdSqe2Xy02hv5xPCX2LwKY620tCL1JldbKsFuLsQk82SSudjf8Q6AeBQV4fuFFcYOW
	rCQXW4Fc33t3A+nBHtiyb2ge3Rcq2Y4Crjb6eFeXcasLqpA2EH1MlcRrXLmcL/nfkfowlNrkS+j
	P5buOgW3Y+FuUdCWLkuorjrNzenFpGKB0aiTd2fpPgUUEgmrjFQbsP0+c5j3bqcWQKhHjZTvjrr
	4c0DPd4jp5LT4+1rc3WY4Cm3KPrX/gEKvyLLh8DaJrxiAf5TT/dQIPntDLIo9eFLTkl1F7whOpi
	955IaR7vL+/UUqH4/dFSRdsheGcYHhTnpw8Eo=
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1675001385a.59.1773101208095;
        Mon, 09 Mar 2026 17:06:48 -0700 (PDT)
X-Received: by 2002:a05:620a:46a6:b0:8c6:c9a2:504d with SMTP id af79cd13be357-8cd6d488044mr1674998085a.59.1773101207669;
        Mon, 09 Mar 2026 17:06:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d08641esm2376849e87.74.2026.03.09.17.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:06:45 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:06:44 +0200
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
Subject: Re: [PATCH v1 6/8] soc: qcom: pdr: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <sm2yj2zmhswp6ydjeonal2upnm6qwokivmrnyajmw42iw2zeyu@d7kwprkm7voi>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-7-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfX7TQZTwYFBKfV
 o267bejJTikUFjKNhO/hTD7ft4qEtyDUCE2dKs+WEvQvb3/d2NockMUi01TT8R3lANTg3ZgKt+8
 b6q3ab4BSzotStTOYwblTAEJSGJJByoa2KPNwM9EnHODOpWMDE6RNld7JmOjQXpZPuIbeySP9je
 x8CzJhzXyclKcCldbQWADEL8fEWlR6Rth1D0UzFKPMDnjxbZHpM2mYa1Ll5rLctjsFjZT73uCLC
 bP7ZRAVkT3FjMUOGScZxUQ60xGMuedVP0oy6kI52TRaPbBiVd75wo9IzATs2xVpYst3j1X6lz9x
 GaQet1QiKLFaWjCrQmGdyWhh2D01EW5fV6KvWOlpOL92BW/1zo4PhIghHf/4ZMb+XvCuZJ6zgeS
 EVuyPiDkAitocnNSe1QC4zw4z8qPHPRJd9K7NZ/unCDECvWBoKZG/NCyc/Moh7lIQlPFrMzeKYJ
 i+/5OFy2t1WIB7VBk3A==
X-Proofpoint-ORIG-GUID: 32H9ZyliiSMJgb2nfBNpo4-EeKZKe-Ie
X-Proofpoint-GUID: 32H9ZyliiSMJgb2nfBNpo4-EeKZKe-Ie
X-Authority-Analysis: v=2.4 cv=WtEm8Nfv c=1 sm=1 tr=0 ts=69af6099 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=1EgtvGsZK5M7WpkkhHwA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_170649_511616_C0421572 
X-CRM114-Status: GOOD (  15.68  )
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

On Tue, Mar 10, 2026 at 12:03:35AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/pdr_interface.c  | 4 ++--
>  drivers/soc/qcom/pdr_internal.h   | 3 ---
>  drivers/soc/qcom/qcom_pd_mapper.c | 2 +-
>  3 files changed, 3 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

