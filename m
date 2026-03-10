Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1D2FCC9A4
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=; b=oWYzZM6o9jEIrIXdKcQIBA7zFH
	Kqa0nSlQpmCjBuJj+TJ3DrhPjVw5prr8VFNkZqcB9N8eXk/1AQryGTObjNC65YM6hqPdaEB5uhYg+
	YdR5HtyI2bFQtxwEhV5YJL4VsZUfX5412X5WxXFmijz2SoyL0g/hK1XcKtSVsJfflqwn4cIkBaNmr
	y7GqNq7sosc15SpAAq17gtYmLuCvc/hziVc+xvevzn/PD/zoyurOf9hgBEkKLG8h8UN0+lvI0wOEk
	Z/FhmzXxAzkeObTCBxGu+pvrsGQOTPJSDbXY+hQeCjTw63kG6GIkiwx5dlRCY6OaKE7MiA5Xv8e8k
	k5tCEmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbf-00000008NBg-1VAu;
	Tue, 10 Mar 2026 00:05:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbd-00000008N9h-15lF
	for ath11k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=; b=PsEJgJiAslsHQRpsgmfESqwgOn
	EBbbxVy7og/1rI3gh//Xz1Ehzd/mrif+K32xZhdAVC+ViCr0jztK2WhwB1sZIsu6QVjgR6LXBdIhX
	J+i2bh1DrIWK408GMEGWVY5lI7GeQjbUGfK9vwpXHh8dYfv9JdCzllA7YJWpUZ8A6idU37xN+VNRu
	OsSMGyxk2ycprUHM2I8fOVh9i7OEkLf0vknVk8Gl/hzTJCmm6/Dyy2fGeKs2QjFpLhDIvsP3TSlJS
	k+FkUsYonqh3v+haL6gB33U29sQ7KVTjQCMxvmwlPPEWidGWHi4ZOcStZV1I9cERSbk2xJTRaAaiw
	6mczvnqQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkbY-0000000DNW6-099R
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:05:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629HBr683148264
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J5CmMvftPQdRpm7qJMkIbf75
	0JXDyx3tsLWdLk1U9gU=; b=aAld0740yTZ9VG9QfBPf2t95d9Rq13GKogiQTT9O
	YVNYct5kxhrYkFEjXZYiFCXdTWtOqdWX1fz7RdBAaZpaRKHCl6JBvyjwJDw0MExq
	MPLnp0N/nfdlQ7ofieRWP8DLgYGP2IMwPo+ClCXdFtKejxMmF2wPfi/eF8L2ZXc2
	qoMiU/Z28kEbDdzdvme029wGhnBwWs2kX4Bg0SRNeXuQsaHYpoqZwqzIgFowJJdZ
	tVDW/ZSRUhTYKr6CE8vuazziYX9UBcvpmd4i2BwtT9oluohV+EJFOGZXe5yRmbmC
	RF0A28dCIGQZsp3CpyRpHss8KBB6rrl42C6MgloXox7vzg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csv5uahew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:05:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd7c4ab845so978734385a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101142; x=1773705942; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=PlonaBD7CjZWWGvkxeTQb+9PM9b50VUaYJLdTQAlwHFCTW7k2SCcxuJEijb7V8IwaP
         fa5QnKbW0xJyixVBJgmmp/8b0+q+ZhHBxfjCShpUJLWnjhsmh5lyEncZyfq1A5hKvfUw
         FD1DS1/Wtai4T0DrU04JTFXD9ZBp3winTb4V0wPmB6Oy9upCNGLMQBzHK0HtmP7hXo1n
         mIV5TxZ7qoEwCnXv3KRGQYFNEOe3DKvvxrVsh+6mhxTNxXPoMZfl3coaZgRYfG+6PDoa
         UcB6q8HBhnBgJTB2hsZqg7hXvzlT8nABaZJOalVgd7SVglte+snvnnfYBLSJccjBavmU
         jDzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101142; x=1773705942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5CmMvftPQdRpm7qJMkIbf750JXDyx3tsLWdLk1U9gU=;
        b=MJTv5J+werYWyBj5ZF5+2lvJ8kSgpNigBOBZGyqkw2dCjpGVrwUSYcLpKO5xP+SSRj
         0lPdy/i96hVzLs4g+9FLOMOoDz3yu0ecwR9iIWJY2ANJhiYpl8e1fXlI9brSHvGqPpNh
         KyuRtXHHbu0uoNiPSTzFD6XcZPgZ+bkbfUMLEY7O53rJpRbknh3un8zRVoHWP6p0GkLX
         9JHBaRrBVRJdtjLj4P+0GhFHuB100RtxtpaL9Dj9T+1nHFEnx/aPxDGdloy5MYrNl9cX
         hXr5L3W+GJ9AtdjvILLdUJqNm9feN2Jy6UzeEqbQkL+0wvZo5UGWFVOf1JBg6uQu/OVj
         T/EA==
X-Forwarded-Encrypted: i=1; AJvYcCUDRGAfORZxIVA0laRKrB6k51HtVZH4eo/GmE7FvoCl+H/ZC/kvg87M7rWOtYQ9UQA9zsQ/vM4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7QBJ03LWD8pAGdrLtvG+jE8SYoirKVIYVu5RWfr/pGr8h8s+u
	qI7wBx+wTn6DoLlADkAd5Z6qTyoXlNQ9SKnbn8pohOEXqLr7n9JJ7wGFBwijRiTs5Lf2rMESF9g
	h0I2MCp6EOsSMV7I0v2m6RvYlAj3KwF0LzOE8UvZgiCJm3nPXxMmxk93lg3Vnxtve
X-Gm-Gg: ATEYQzxiCp/iRmO2FAvPd34k736pUPa8wPa81JP8Q/rx9jOqspPpGQeRy+yHgBcLGIS
	Gg82VabXWsfBB+fdPFxrDYD7j7oRiGuleT9wzj9eP48sTI5ThLXz2hujoJXrcZbbhGmLhPZCkcc
	hfVdJFFItCY4ns6eRs47P4g2myLeVrkJz6tlJvNAnuJESl3vB6aIQ/dDry0TB0priUa06K9rwye
	CFIP2v/CzhA5d/IAsTWUIwW2qywhvUyF9sxJry99iGifLJVlh88+vKCOISqoUr8gHJvGBs9UKvI
	Q815yQKG8TnEJesnXnoYZu5DtEx+pbZX638bFaX5Rr840dswej8ptc9Ko25Y6M4ojGfBzQCYkyA
	MUkPTHjSQLQVbr0KiofxATxc7NX1mrBc5Y5HXL3ycVv26ZjP3juV0Bcl3g7uTvds68RJhr0/01A
	E0AcOvFwpl5bDiF5tjXrddxphjaFSt3QiSpPU=
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491284685a.78.1773101141875;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
X-Received: by 2002:a05:620a:25cb:b0:8c5:2f36:660f with SMTP id af79cd13be357-8cd6d4afe58mr1491280685a.78.1773101141400;
        Mon, 09 Mar 2026 17:05:41 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a13d07e051sm2527439e87.57.2026.03.09.17.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 17:05:40 -0700 (PDT)
Date: Tue, 10 Mar 2026 02:05:38 +0200
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
Subject: Re: [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID
 instead of defining it locally
Message-ID: <uc3jucz5fafdy3d5d4vtykozt5kqfyeax55nb4yjj36vnyxdtw@uwabt65hakpo>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: YYCC2zqyF1bHL-zLHMYRCPjHZO7zzW4_
X-Proofpoint-ORIG-GUID: YYCC2zqyF1bHL-zLHMYRCPjHZO7zzW4_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXyYHaXdvqjnaU
 DQX8cfBctPL+U0xmgeqlxLHpFdXmc2Zk/ltxtorS2X1XYj/lr3Hd7Ss3kk6xgffF5RDUHh9hGaO
 135X8746tRPa909ytr1O9ZFHITFnZFbNwTT3OWZSbbQTEJq8AdGK42Zl8DAYpVm6LoPTd2XsisM
 A2nckmAnSqXksNOZjqo1rJEffSdtVQXRlUyM4MHC4ciLO/JDyC7xyJiU3h5j5LmxTQokRtArYvR
 dPeEKpx15JdrOi8RZEM0QxZXB2pzhGf1I5dK90oxS4/UxzgI64mTMoPjgkL/pJhc2GIhgQD++dG
 BXL8IrS+VoRlBYpBA107XkcwYSIw0+GbKKGJUEsjsaXRbBXtNzzkukJ28FVobCKTM4xyBLLoidv
 Zvbwi/4Nbk5Ju1xXsF5+JdqgzNzQtaVYzLiXWBWOX+GBz16qDYTgo+yDUa/NF7G7i7xwP/Z+8bm
 s527aaDYvhhP4SoZ42w==
X-Authority-Analysis: v=2.4 cv=Xr/3+FF9 c=1 sm=1 tr=0 ts=69af6056 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=4Fe6SZaiIdGEmwW3mTUA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000544_554761_9E9E1F09 
X-CRM114-Status: GOOD (  15.07  )
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

On Tue, Mar 10, 2026 at 12:03:33AM +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  drivers/remoteproc/qcom_sysmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

