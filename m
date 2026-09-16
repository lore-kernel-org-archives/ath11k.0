Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F5DC88E75
	for <ath11k@archiver.kernel.org>; Wed, 16 Sep 2026 03:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=FQNNVYwfnQES0OdqOiOl5Xl1d+
	yRtNmZKHk6L7HHZD1qDMsdKoCYU4Lf7QtIQype2RNWEpBLNN0kdW3j1q1WPw6bPR5TizImSPUoFkb
	gNrF6mpS60VzemahaCthICUisRa7Tz0ulFGezyGk31MlWe2BzYjsUXMSKru4IgWFPom+5NFXm8H7m
	V6FggO48EmQYsN1t04AspZK8EDtXRisZNi1Qdpej+tFaLUMVuXz3A0FfSfHauhIBW4hLXfx8gO+Ho
	qA6er3nSXQdu0hiplsRYMVcflzulzXRoGUdzHulAze9tqEXZ8IiW5AG7cTWmKLs6f3egOw0aEHtWt
	h6K2cReg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g1L-00000008Dxd-2yhd;
	Wed, 16 Sep 2026 03:09:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6g1J-00000008Dwc-2trH
	for ath11k@lists.infradead.org;
	Wed, 16 Sep 2026 03:09:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FM38dL1932203
	for <ath11k@lists.infradead.org>; Wed, 16 Sep 2026 03:09:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=; b=C2+SAIH3viTGtLwt
	anuftS1UbBrRY8f6gP9mjistQDrN/AsiOiQf3x41sBtkTrxkv2qkMlbOelS7+vFH
	IxyGug34Y/8nBg3B0mKx4XygsIaqK+JD22LiMRTr4Iy5BUaoywgK+ha9vuy514bj
	Yv09UMS81I5PGX+OFQalGYMrKhGXhHuKYqG+0r2uQCrnEHQWgGabyWsvjY/Q0Lao
	VN5Lj1mSx7kknMqcLPpKj1pebCw5TB3fCq4/rVDxP2uuD8c9A8X/6FqQ3xbfhJMO
	olYD8haiGPL22qeTSxSnAJ5yAO7Drp62KAgx0RiblKph5ca7GqEBIgHXjfIu+Iaj
	ZhKE/A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefp8vw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 16 Sep 2026 03:09:12 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so2605485a12.0
        for <ath11k@lists.infradead.org>; Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789528152; x=1790132952; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=jRbop2sde3ao7ECLq3oKepYMJRQ8dSOzPwjIWtkkRnjZhCIQmaxbcEreCsgbb28TF4
         5apD4Ot/GF8CZ+F1DVN3DzRl4lHbzLF/0wNwwpzEtK7l1Jy83bUVR+qsyZVnh1aqDCQh
         wCxuAMJNv7DhT/rb4Lm9jkuA+YR8NOMSUrPbK5g1/szEuht18UDj7sbdyiXaPSG/Ce5q
         aN0vsJnfrKLPvqmp/Ila5NPGTgw9a+LnSkSoqJ/P0Vlyp+/khh5WzkBCEysyxtPS4Hxy
         YIUrDPMGm2rRk1b7sNWA0nQQtv8pn256ghFAEY4oPCiVHC7sM+F9VjUPHKjv1RDTODpU
         jytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789528152; x=1790132952;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ag/Pmmtchq8t/DVKB8xq+CT8w46MUWWfnfZyBXqWQgw=;
        b=USuwKoPiBlEboGqTf+XNlnNyflwaszA2Z4dfFZIUzb29fAYu7c8bzmkzoiBRTZfgXL
         yiwsLzdc9ylqL+Pg7DchQvuRmSQeO0q/NRkJOrqHXt78GORFn4hWJTUNF+z63/iQtFRJ
         hVWjirTJJM0kvmsqKpjlpRSC7HvaZGnGlw2d87PWhgsrqoPg0Ifj7H8qGU/gAkpPcLLT
         MYDiXbF4A/sbeI0IPbslJAFYtzOPOuIpItth+ZLtiRkq6rMYQLeumXuGvbcBWR891uX1
         c3O9m5AHWpIswlXhfAdmeMhGmsbKZ+WnqBwB4snl0O0MLN7i2e3Vli5/dXmaEeWDqKql
         s1hg==
X-Forwarded-Encrypted: i=1; AKwUvByOt2/1XJYl7KgFVb4cjLcIdVDTbxHJ4IbCJ/23Fo7pawhx2M8KfPqA6PORTcpUF0PLkOBxxF8=@lists.infradead.org
X-Gm-Message-State: AFuF++n4bjZUkHIOhkD5hdFVISzd2AjEzdzIzTogGAQEUJ30b5aoPPDj
	6Tvt/wfDnam3c1MLKBGfyQtRnZq3jU3+Q/PSsSsfPhPP47YZoqXxhTPgmamuXnwEf9aEU7bdavd
	ZYeOCpQnYUmfmsvD9AE37R20ekyHtftMPIlQ+hZrzSk2KFdPXnbtV6RnJ7ndTFgb3vRwEGHkn
X-Gm-Gg: AYBFou1Q284qCMeXXoZaRI6HCfRpNobo3yLDKapO/3bn6ONoRY1gvKeATRJOzWL6n+9
	M+fnj0kPnac7k2xRi10/OC50gPXRkBCU8uBE2dyTeWLgHmKesqWl4ek8dUhJGt2tfwOmh6AkCB9
	dEoNvc/gmbFTuucA8owRPU6XWY9ZZ2jmHGS9ngETAXHCaM/vj6I9iDdSJRYb9nzxkOyHvybZYoT
	1bjnYwVlziS56LBgQJBQCMizVZyZyPEl2ZvXVpSxsLRaEJkvCaGTWAjS50Vaxk+1Vl5hBe+8sAV
	qkXzmGmI5e3t1J/AEoicnwBSdZbfVGVH9jgNLNL9bcXlLXlGZCvthBfZsWMckGZNLO1aKpwAJCk
	3YeqweEVl4YUHdgkmPD4dhmWtZppGTXaDRxgM2NsSAUEx70peFsMDHM+19A==
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015607a91.16.1789528152097;
        Tue, 15 Sep 2026 20:09:12 -0700 (PDT)
X-Received: by 2002:a17:90b:384c:b0:38e:9ef9:eb97 with SMTP id 98e67ed59e1d1-39e1e48a0c5mr2015526a91.16.1789528151476;
        Tue, 15 Sep 2026 20:09:11 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5e40494sm3191996eec.15.2026.09.15.20.09.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 20:09:10 -0700 (PDT)
Message-ID: <6257c447-788d-4362-851e-0d552bcf7c56@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 20:09:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: qrtr: resend HELLO on MHI resume
To: Vlastimil Babka <vbabka@suse.com>,
        Manivannan Sadhasivam
 <mani@kernel.org>,
        Daniel J Blueman <daniel@quora.org>,
        Linux regressions mailing list <regressions@lists.linux.dev>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Takashi Iwai <tiwai@suse.de>
Cc: "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Pranav Mahesh Phansalkar <pranav.phansalkar@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless <linux-wireless@vger.kernel.org>,
        "ath11k@lists.infradead.org" <ath11k@lists.infradead.org>,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20260909055846.16539-1-daniel@quora.org>
 <hcr4woicsnz3pbhzlguuwjlego7yli3znhjmsx4cdz66xa74zd@wjtle2yslc4b>
 <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c99d9feb-0a19-4f8d-915b-c2ece401e3fa@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfX4fhC78x9trup
 GpAsChz8fusxWToqMtuod/iElNItUTggqLYBC9UAAz7qhOuTRug/ervYgViZbGG5qr89VBrrr/d
 DloLuDc3Rl/up2ym7KJ52Pxg8gXWFuk=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa0858 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=t9ty7G3lAAAA:8 a=EUspDBNiAAAA:8 a=_wE0MnXGkHm9nJMVzvUA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: V5q8xvEtmsUd-IvYwkpDVIhBEcKqRJUI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDA0MCBTYWx0ZWRfX8fbCS63V2vSb
 V3FLOejlbfB9nHI7LuAmyezgCkBkGVwrpHM83GLU6K4NupOBIzYKbGDId5+b8kJjUajnEyky1l4
 LE041FYR30sG1+mKCtPjdYaUVns+hqZd9QdjtwBGYLqI2FJDHBxA9yllMRriiR1Z/JH1pQQb+zw
 HjZQWjEOSExo0JlU5O31HZN52a168XOfCMmWto19aNdXq100mxIUPSiVR5F12qDMs7JjGuEmleI
 48NgD6G/9OyU8othV2nw+P+MG4nLYXS0TQdQwficW257NfiSXA/O4ijVQ2cL3NbNZd3nm1+MRky
 d+LEqSCB37J1bN6pRLHe0lvOVkhp+BSXEvNqgTPivKlNEKXMu9WnibpYPHurdv2QqNrF0xE9fbD
 HY3lyILAs9f3EFLVHe3OdTOGMHxY3bkCrzHxbXOBhnRifWQ2pKrsEhZo6LeF56K7KjNsCSKOHui
 byCjsji89e8r05eVuTQ==
X-Proofpoint-GUID: V5q8xvEtmsUd-IvYwkpDVIhBEcKqRJUI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_200913_741581_35B0A215 
X-CRM114-Status: GOOD (  20.57  )
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

On 9/15/2026 3:48 AM, Vlastimil Babka wrote:
> On 9/11/26 12:44, Manivannan Sadhasivam wrote:
>> On Wed, Sep 09, 2026 at 01:58:44PM +0800, Daniel J Blueman wrote:
>>> Since the MHI HELLO exchange was relocated, it is sent only at device
>>> registration. During a suspend-resume cycle, the firmware in WiFi
>>> cards such as WCN7850 indefinitely waits for another HELLO,
>>> triggering:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: timeout while waiting for restart complete
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to resume core: -110
>>>
>>> Fix this by triggering the handshake from resume_early in the MHI
>>> transport.
>>>
>>> Validated on Qualcomm X1E-801800 on Lenovo Slim 7x across 10
>>> suspend-resume cycles.
>>>
>>> Fixes: 544d85de4dc2 ("net: qrtr: Send HELLO message on endpoint register")
>>> Signed-off-by: Daniel J Blueman <daniel@quora.org>
>>> ---
>>>  net/qrtr/af_qrtr.c | 13 +++++++++++++
>>>  net/qrtr/mhi.c     | 10 +++++++++-
>>>  net/qrtr/qrtr.h    |  2 ++
>>>  3 files changed, 24 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/net/qrtr/af_qrtr.c b/net/qrtr/af_qrtr.c
>>> index 78347c937af7..2ffcfc2fdb4a 100644
>>> --- a/net/qrtr/af_qrtr.c
>>> +++ b/net/qrtr/af_qrtr.c
>>> @@ -623,6 +623,19 @@ static void qrtr_hello_work(struct work_struct *work)
>>>  	qrtr_port_put(ctrl);
>>>  }
>>>  
>>> +/* Trigger the HELLO handshake after the remote has been reset, eg on resume */
>>
>> Use proper kernel-doc please.
> 
> Please prioritize merging this sooner than later (it's a regression from
> 7.3-rc2 that would hit people if it made it to 7.3 final) even if it means
> fixing up non-critical aspects later, or by maintainer upon merging.

Concur. I recently fast-forwarded my ath tree and picked up the buggy commit,
so everyone using my tree is now affected.

And just want to point out that many of the function comments in this file do
not use kernel-doc format, so I would not consider that a blocker. But it also
would be trivial for the maintainer to add.

I've tested this on my HP ZBook 14 where I've replaced the OEM Wi-Fi adapter
with WCN7850...

Tested-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

/jeff

