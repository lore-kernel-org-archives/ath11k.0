Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C11BEFCD9F
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 09:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=tasVlBl4u14szRo9r805XsEMvB
	t84SvpPMZRnnw0L5IbrQbQyTzkwcK/4qmUULe8M+U1sNm8Km8ym394eaOwfhmk1x+nCwRGBE1oWBz
	h3W7RIhHDd+ETmkJIRWIDQnKYDNFqZpekBPz4jnQYFYhbZyh4Gg3assAw8XGRYjjtPyTC8/czcrNE
	QUkks0IiV991gdg8EKUZZMbQCTjWshojCFPdGnYt3fhjzQ2sPICw4anaGO6v4dMZwq1AiVBP1EBJb
	D8fUYpVfZR7D9lCNF980NI3+DuFVtYYw4JIWeZkcXO5cUdsXawzbgQoZ4zCDWMCMRgiLH7Zhl09Xd
	8SOONE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztq3-000000098w8-0uap;
	Tue, 10 Mar 2026 09:57:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztq0-000000098uf-0kma
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 09:57:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A97fOs3754619
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=; b=bM29PPBAOfK0D3uO
	ml3hIfgefl30u0LjMXnpy4nUYL85G/cEds2e5/kBbiqC9ctGt0Rg9xewFlv+bowf
	xpYjgzSj4Dy9TPBlCmBXYexZkzHfOvRwjBz2rV8i+Mt4PStfAt7DZC/nAmt9Nw15
	/IGuGCecOGf3hN8IV17tfwr8mgJTSUIyftSW31id2pZu+r6nMd6ce/24ppxrZZqs
	r5rxs9J+VWOU3l0Jo8Yb7aWIKqF9nwiw5pdXy6MM24RTUDYRr+jGa2UskUuovWFO
	AA0dky8LS14sXa2uBNrJhVIdFUgWK3jNdtKlMooKWWw3+2tx11hsreyrcc0kXql3
	/YvAFA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct477jjhb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 09:57:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a081737bbso67866896d6.2
        for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 02:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136634; x=1773741434; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=R7pgrlQr3xWtfxnj6+IR+OblPlqCELYDHRkEZhIL6uNb4L/0l1nGJmOKczxtPuBqHH
         ZtjJuG6X6ule+JrL60Db7/qDE3HMtm5W1nv1O8uERIurz33SKIdgRnKWZSH1feoLS8bR
         w1NPi3dBemR6tcjEhG0tSc40OWy5ksCNKPIlEtJLx3i/vzf/PZMK9PmXxYB17UDmnR6I
         UY4cSV+zvwYDLPEy6jX1sn3M4p5lC8+Ymht0Hm1aC7aigfGJxeq/Jfi6StvJgV457rej
         PP3jv5FDmJ9rEXAWj5JMJs7yQkEblbieYQGX2sFnW6zwS6EmwazcGTRzjumebk0jP89C
         XRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136634; x=1773741434;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6oJ8QQt604h4CfSsQepU3v+GHYIoK3WGwrJxaSWp0RU=;
        b=bXKG/hs6QTFMzmjwYbuwvgC8gXqg/3n8BoOTBrUfx6zQ1rYPIT8C2Rew9FyeXZTfsD
         DEKl7yk8YEfVQC1QQKHpDd12bh+qRyE4mkAZrkbQhAm49zkfZk8rkic0QQsmCBx6VQta
         dgpA3NAwuSaz5/+yGSZqzklZ2z/Sg1BuIKmyNtmKv4Csg0eM2FZy1EMa63w9TNwTpsqq
         rWGc48NG3CEl9K4q8nOIM8LLieU+IOD19m1O88gWq8+xLy0lAj8EP5L9oja9+K0HzoLH
         Xla32VW99RFnwUSi09JEAdzDBzUZJhb80BAGvR0cQU6WzYS1uxbXQCx8I7CLdjY4r8ov
         Ilbw==
X-Forwarded-Encrypted: i=1; AJvYcCWc/u2BFg/4ueIL+DOt1ehy3+O/tKFLSxeaDXo7m/PSoum9Arx/jCTumPslv3RTfVtyv9J9OS0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3COJWMKjF7cJw0tFGROou9Kt1MNk8C2M280b546a8PI0JAGAg
	ByyEkRehF/1s115GpSAWn2pccQGoyc6FKUro7b2rHzmRDagI1Fz9gQO6+VUPwRiKS/hh9pY9y4K
	or5tVdaqF3zhKRY7iO+Bt4mTxfc+OqKqI9c7/bZ1mZY8u6osu/ojKznI0KZe2o8Ls
X-Gm-Gg: ATEYQzzHEKwgSSAfOHl9LDWPtvrLXxlFuBszt2OxVCF0oezoImKreE//aU913mEiaFQ
	9eLart1bqcZDXMRr1jBkkZEKk4cI+TdibInaX7UCNU7drD5A2WE7aOvDaOah+1hvjv0WG5iV6Ud
	bI7QfcXseFbYoqSVrdkvuyaQ5pRjx+dmWTcO8+W77Z6kH48Cse87AOuJ+R+TwlPpYcWHBgYYTnQ
	1VVdRXvl+penZWV00eF0U2Op+dMfpq80K7y+6IqIu3gtr6Y3BK5ud8oqKn+LuQRnb1edIk6Ga1y
	6qmN6vnXX5T6oxB3Ph5JdLRcXrU2tMfqq1gxTYjG6HR9ap61TwHSiZz2qCJMEHYI0WIoqF1oxsj
	vM12zK7mnZCPjxBvrBVtUwd/M0X5s7eoSNU1h1aTsx7xN23hRAgnSMjeOsySQM49G+Ze2aScwKo
	V+NeY=
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82170186d6.6.1773136633821;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
X-Received: by 2002:a05:6214:4e1b:b0:89a:49ba:b58a with SMTP id 6a1803df08f44-89a49bab894mr82169946d6.6.1773136633432;
        Tue, 10 Mar 2026 02:57:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942ef483f3sm447860466b.9.2026.03.10.02.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:57:11 -0700 (PDT)
Message-ID: <7d036c96-e257-460c-a91b-deee0b9c348b@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/8] soc: qcom: qmi: Enumerate the service IDs of QMI
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
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
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
 <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260309230346.3584252-2-daniel.lezcano@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NSBTYWx0ZWRfXzHYMQ4wOxew6
 cFP7N89Err6Np2SlJByjhxTUD3kFcHxyDG+G2pLTi8fXfN80m1YRVpBHEjZ7txNK7TREkGmBsqV
 7rVc4E46lqjGaG0hdPDTkTNkFJ+mlgmu8tl5f5fjtj+uiDIZ8t9cfQl2g+pSi5AFLUF884lBW2S
 lm5Uu1eigvtHngwV3vFzBYbT2xlninWnadJMRkfoBNdhLequ+Uz55RO3qTkCL30uAKtyRCkCXdh
 pxlMZEbhhwPCbSPikcN31riV+jN8hbYCHgYxeJkU09Eh8zY7fGlEduDzxO+xupfMN1TxJqpQIGa
 zhLK5N8HFWpaJ1Kift3SYeMIJUawynBPl6pFn9T3NfXBTn3BO8/TSKLDTHVFjK9ViugwbT+6Ppv
 7G6ibADtF+rPVCZ9U6CWUCD7y0JLD5ekGlWQSxMPCCxGQu+EFnfTQ50GyKHF2xOCgt4V8fGOWU6
 hBsEJkQy+xPJl1cER9g==
X-Proofpoint-GUID: y8HdvN0Br5jQX_zyaKrWDw0EbHlYOah6
X-Authority-Analysis: v=2.4 cv=KLxXzVFo c=1 sm=1 tr=0 ts=69afeafa cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=7MBKnE05AAAA:20 a=EUspDBNiAAAA:8 a=Lti85_ANQs6YWTYAGLkA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: y8HdvN0Br5jQX_zyaKrWDw0EbHlYOah6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_025716_341136_1BC7AD96 
X-CRM114-Status: GOOD (  22.63  )
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

On 3/10/26 12:03 AM, Daniel Lezcano wrote:
> The QMI framework proposes a set of services which are defined by an
> integer identifier. The different QMI client lookup for the services
> via this identifier. Moreover, the function qmi_add_lookup() and
> qmi_add_server() must match the service ID but the code in different
> places set the same value but with a different macro name. These
> macros are spreaded across the different subsystems implementing the
> protocols associated with a service. It would make more sense to
> define them in the QMI header for the sake of consistency and clarity.
> 
> This change use an unified naming for the services and enumerate the
> ones implemented in the Linux kernel. More services can come later and
> put the service ID in this same header.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  include/linux/soc/qcom/qmi.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
> index 291cdc7ef49c..b8d07f2c07e7 100644
> --- a/include/linux/soc/qcom/qmi.h
> +++ b/include/linux/soc/qcom/qmi.h
> @@ -92,6 +92,18 @@ struct qmi_elem_info {
>  #define QMI_ERR_INCOMPATIBLE_STATE_V01		90
>  #define QMI_ERR_NOT_SUPPORTED_V01		94
>  
> +/*
> + * Enumerate the IDs of the QMI services

In case that's useful:

https://github.com/linux-msm/qrtr/blob/master/src/lookup.c#L23

Konrad

