Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13E32FCC9A4
	for <ath11k@archiver.kernel.org>; Tue, 10 Mar 2026 00:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=xQvGpmCWVhl7GD7gVn+TBrnmQX
	YgWkYP1LUNsN4whw+knrYvxWQ688u9PX71/IKkwFMhMMJl/dNiU6ILCj8KyViqEe9QTz5L/vJa8rL
	VzBeKdNAm60Rt/N6DL0F2AgxEw7hl/U+mMVGC79OUvEsvt2zH48BHfNpx2iorxsPWsGNepiLhmAZx
	+9x5Rd1LjUEGsI68i1CwAzZUQuyh4nrgDrR/P9spAczqmME5aivaRiyAI1YdDQgISI70kOVFFY+iO
	QC7s9AHLkvu2Z26NJRbGnwHDdimmcWDpDVa/gfrtpyoEYRoLlou1XfucztOBP9oXZxiA0WI5dYrz6
	JAyAy3Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkf5-00000008OKr-1d8x;
	Tue, 10 Mar 2026 00:09:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkf3-00000008OKZ-45VT
	for ath11k@bombadil.infradead.org;
	Tue, 10 Mar 2026 00:09:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=BvMZ3v77/sfiPT9gWbKaZeTJ2q
	Osthjht8URz9XOh7JoyIDzzobEkb5Z/rS4SB+s//JG8kj3yzeN6viKLP8P0FsPpFLF9N1X5PQBBFo
	XnYrlAi3qipG7zNjPPZJDf7MFo0zwS1MFvDTGXTKVT51gG9Glv61YNwVAgHcFUmjT0iZk9xI0XwOt
	gj1W6QgzzeN14DFpYWRpIRbqDGlDUBZ1IDBBf2mZNAIv1U/vLtzj5+I0Je7cr3cMxFmEMNoN+A9y0
	Mr/LnkV3vZO40FMvdrkTpzGuXlkiFjflnG4Dzf4N8+rgsKuGB2kBodK8jVmBguTsmYTecdJiHKl7u
	RUqLVRuw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzkev-0000000DOHd-23aQ
	for ath11k@lists.infradead.org;
	Tue, 10 Mar 2026 00:09:17 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629NoR6Y4130836
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=; b=dUPs77F4pGXERTFD
	81tbz3Mys0cMxTotueTQZHr2XFKWf/Qrv0mB+kbTYqLTg6OKniVnRA7wK2D9ZVdF
	f8J3Pjfj00iYMNPne5rhQ2Ij6e0qFSEruhvUob6MWoygiBwySVHZtzb0fPGhuy+c
	r6GHvu4r2mnszOM4EqEscrBodR7PJJmf7xLXrK7WpKaOQQlEdNrjNZlHrl5mNeZb
	GLKoyRCaJLbuZT+o0k8PpI7lH83lHxqI/XwP1E4oQvNK3n7XgyibmT8jsmm2Bo5H
	FRsh7ENIQv/2QU06wGk/QKHEgYJiesvRZKtqycMfTdMbl21bIm7MhBuE6f4dWR4l
	0GkcIg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ct88001qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 10 Mar 2026 00:09:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd91c0262fso420491785a.1
        for <ath11k@lists.infradead.org>; Mon, 09 Mar 2026 17:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773101350; x=1773706150; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=WzzbXJrqcSxHAGv4mnfrVu+oRYfNg9VEBAvhlvDqHsZlXFhjRHssDhQb9POjpR9QzY
         YgikLPIWY/pQum4/n31OdiHVbWFmBvUBgquClGc6Q1gC+1ORYZ3AIAhV1vSwcV+g5EQL
         ArY7cuWllCTXa1JLn4NxFKrI/8+QI5AL2u+qjijJXu0qtWRmU2a7lLWdLVdJHKqqHhxG
         ofMxaY8aVcDksn939+343G6RVG8gekrvH0IMIw7SpRpq4cccIiLDXrxV2f+59LgnYbWs
         kXSRKpYaz7sml0muR680iKRuiug+TzlLRo5G0LR8yqI/vFEdOg1GtNayz5BBG4CYn3Fx
         4h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773101350; x=1773706150;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UzZKnoilqHx4458WKUDAbi2+T8n0C2ogsIPespO3GAw=;
        b=lygJOPEJxncFrJhnn9gVu1ywFkNTgTvuYc7RdEYIxUtobnq0BAnCo9E/1XH3PY9me2
         ZlI9g/ZL9koPWARY82wh5gh4pxNAA/T8CjOFve12IpHByPGl/RTZA7PDsQdldD8ZF8YC
         Cn+58tCFXnJv6Twswvtn4lujaV7NyG6UE4M8Ko+Gi+gcusvNSDSyAHM1BmcY/4Y0UVfN
         Ae+No96MTyxzjlju9nUVE+ZiGKF/h/pMVM2/pD3cwI7Z7WKYeMHSfSyBZBktUwM1jzrv
         8pvxVb8tpyfVCB/ANsudpbXRJM3IkjEyxYBDvCJSUKiGnXKq06BGJdclwNCxj3VdZKZe
         UWiw==
X-Forwarded-Encrypted: i=1; AJvYcCV0jmyv+rPZ8K83zRPlFO9Mz5T4EwD1PSHXIiUMDxvrCMVNgzHEDWc7LGY7I2mNl9uWMIEDOMk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVoykjGJuQV5vG7+aYxImqSHoGabrWdvnv/fTXsaVEuC1suCji
	4qOnhCAoPUgtGKknuWBcUOVavzePUhoJ7N2ULtKxeTJso+puCY7EgTKfhDTRB4mi6DFxtKPXOMi
	G2eCox/rIzuqiy+wwc7FayJb7/WtCNinK7zu6GYYFp70UqNmQfEqk5g56jhaUqAj5
X-Gm-Gg: ATEYQzxqNpt6HDM55MFQiQy655flWGwjFKGnwuUfCoQkvNtL8LAMfUd2LBs8oAkeWP0
	ft/aPPFDoR0khUU5jVVJUqQ3EtEoJYf6pZFvSr2ackibiXro3BxvPUR/WRY+YcYd9WEDQX6DYx/
	7R5KXasDZ6iEgr+2VjdhomzDijVsfMgoxf0x8YnhMZHmHUmR5Je4DfAKz7KtLUu31OgAqt50Bz0
	9C75Q5uq2etRRHpyD6VdrGVQi0cXkx0Obr0klBPuCbJVPjPnPcVECh9kyWKKhOkHJ0XLJ+1xBVG
	U+xudAeSNBwsBgOoVxF372lUaJM6gUzofQYp9q++q+Pjl/5ELdrN3sNrtjDr+KKQ5QLNVOwW1bo
	omSWB+NtbBYFCfdNaH5ZAAY0P7nsajeCIlCrkGW1FDA6gXXyinIL4twubvK5lLUECJDtp1vHcWj
	VcLeBZX+z8
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012758085a.65.1773101350463;
        Mon, 09 Mar 2026 17:09:10 -0700 (PDT)
X-Received: by 2002:a05:620a:1485:b0:8cd:75df:f2fb with SMTP id af79cd13be357-8cd75dff685mr1012752685a.65.1773101349998;
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d973sm28840297f8f.3.2026.03.09.17.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 17:09:09 -0700 (PDT)
Message-ID: <3283cbae-4100-484c-9b00-1d7111c62456@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 01:09:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/8] Group QMI service IDs into the QMI header
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, konradybcio@kernel.org,
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
 <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <9cc7638f-1232-4cb7-b4d7-cdac66a2f4ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDIxMSBTYWx0ZWRfXyfD/VJBA8aKS
 X64DELCSmf2PBURpWTUXYC4olZ1EEYC23RUdyR2Q+LrvvVCWfMsaWMGWLaDjG0EyMUuPCbvkJp5
 0HA3iwjqsxtDFSywwYfbWaaxqWNDBVf81ygNwWihamITfouoI8sq8HKOiWwPJaItO3wJhLgz4am
 WNGUpnHsUsGfEzq6mVERcAFDK7U94t03U4TP2nR19MNMfYo5oZ7x6qGo5OZDC4J6fQx9PuWWpMv
 eLFHLUCtoVwNfLcNXH/K37+zncjncuzLNRWUnpANTSfTDj3gGNg33+50HbYPI9r0x596aQErhoF
 aXK+o4VvG0sZaXDsb6EVX5rD9JXwzlT3DQJZVQTpuT1XVduS2qe6T0AZE7kevdfWnhizOM3foiT
 KYvWv54QJhdyl1rJGOUQqgI4SuJ1bRBfXYC6gwyXs/86ZPZVMBe74qDiPIewSDAD/2SEX5dWjXJ
 iwKTj4wcbAykkY/MPcw==
X-Proofpoint-GUID: h_uR5jfyTNosjuNJA63jZpGQXTE67-pD
X-Authority-Analysis: v=2.4 cv=Jtf8bc4C c=1 sm=1 tr=0 ts=69af6127 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=H3M1aXInkkIOK4AFoC4A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: h_uR5jfyTNosjuNJA63jZpGQXTE67-pD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_06,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090211
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_000916_182422_7238C5B1 
X-CRM114-Status: GOOD (  18.02  )
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

On 3/10/26 00:50, Jeff Johnson wrote:
> On 3/9/2026 4:03 PM, Daniel Lezcano wrote:
>> The different subsystems implementing the QMI service protocol are
>> using their own definition of the service id. It is not a problem but
>> it results on having those duplicated with different names but the
>> same value and without consistency in their name.
>>
>> It makes more sense to unify their names and move the definitions in

[ ... ]

> prefix for wireless drivers is simply wifi: <driver>:
> so s/net: drivers: wireless:/wifi:/

Noted, thanks

>>    remoteproc: qcom: Use the unified QMI service ID instead of defining
>>      it locally
>>    slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of
>>      defining it locally
>>    soc: qcom: pdr: Use the unified QMI service ID instead of defining it
>>      locally
>>    ALSA: usb-audio: qcom: Use the unified QMI service ID instead of
>>      defining it locally
>>    samples: qmi: Use the unified QMI service ID instead of defining it
>>      locally
>>
>>   drivers/net/ipa/ipa_qmi.c                      |  6 ++----
>>   drivers/net/wireless/ath/ath10k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath10k/qmi_wlfw_v01.h |  1 -
>>   drivers/net/wireless/ath/ath11k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath11k/qmi.h          |  1 -
>>   drivers/net/wireless/ath/ath12k/qmi.c          |  2 +-
>>   drivers/net/wireless/ath/ath12k/qmi.h          |  1 -
>>   drivers/remoteproc/qcom_sysmon.c               |  2 +-
>>   drivers/slimbus/qcom-ngd-ctrl.c                |  5 ++---
>>   drivers/soc/qcom/pdr_interface.c               |  4 ++--
>>   drivers/soc/qcom/pdr_internal.h                |  3 ---
>>   drivers/soc/qcom/qcom_pd_mapper.c              |  2 +-
>>   include/linux/soc/qcom/qmi.h                   | 12 ++++++++++++
>>   samples/qmi/qmi_sample_client.c                |  2 +-
>>   sound/usb/qcom/qc_audio_offload.c              |  2 +-
>>   sound/usb/qcom/usb_audio_qmi_v01.h             |  1 -
> 
> You are touching a lot of subsystems with a single series.
> How do you plan on having these land?
> Do you have a maintainer who will take all of these through their tree?

Yes I thought Bjorn or Konrad would take them with the acked-by from the 
different subsystems

