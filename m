Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 787A8C83F03
	for <ath11k@archiver.kernel.org>; Wed,  9 Jul 2025 15:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJx6t7w6ssrs3a9tOwEvfHFgR1eHqpcHEVJO/pfvIZY=; b=uDPJBn1mRkPhLTHRxFV7mmjfFs
	/leLBnc6PwF292lF4uDwuLZeweS8pT1ljbYja6srwS3liGrfdiAivny8Wsz3MLYlthjT0nr6GgCNY
	TNYRBqCMgKpDpsbI7k4/Cb9q+VeNRCYrJCZMrnh1w6Ln1gGzfSfHpfFwoTPCdapJVIc5g41MfIXXZ
	nZ6WJm/NAWEOEwp1+vqbU2mx4v6B1MwSr2vUIYO1KAkCYKiZ51NdYMLZUc9e41KdjbHj3qTeiy0S/
	QAVbGitFuGPKRRWsrOp/ssdjMMd7CNORpsHf0EAl1x1ZxYh7sKJpII2H+oXCY0QGbMSesCXpGQUCM
	GAPszLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZWLp-000000095s4-0Ykd;
	Wed, 09 Jul 2025 15:04:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZTxU-00000008e8H-1SYL
	for ath11k@lists.infradead.org;
	Wed, 09 Jul 2025 12:31:33 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5697jpVW010471
	for <ath11k@lists.infradead.org>; Wed, 9 Jul 2025 12:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iJx6t7w6ssrs3a9tOwEvfHFgR1eHqpcHEVJO/pfvIZY=; b=Bl45FezI+8ohQ6Fs
	efgc2EZuyghwoIPcmAUNMZ+PWHFI9zV5bjYaxY3C3FfMrmh7bscGdS9dCnksJPMW
	Tj1NH4oO9KP+N9Ig+rO/QCpnd8y/g4cBHOszdZ1Eb6ybxoFTAuGls5rnOESmNiDb
	+8/HhVGyWeodCpeQ2PWfXgnI81BYFkw1DVYMYw5nGEyKjSE5VHTUKaX15tZUpgNQ
	DTtwY9d83yAEtyHbsF/lNRBWcBiXnWiH8P9TzMnJwCPnDDu8/j70ojlLg7ulb4cq
	3c3BJohQmGRK451I98VQuOpn6OId4aXDm9nab7HgL+US0JqaLIkB9u0zb1kyufCm
	Q0vytQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smap10f1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 09 Jul 2025 12:31:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-23689228a7fso73865645ad.1
        for <ath11k@lists.infradead.org>; Wed, 09 Jul 2025 05:31:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752064290; x=1752669090;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iJx6t7w6ssrs3a9tOwEvfHFgR1eHqpcHEVJO/pfvIZY=;
        b=pn5NDPG76j+lmrm0YglrwIHdoSybILM1bhlTka27njzS34LG07dzj403QN11drQrRd
         gZ5ESJNFcYMcIS5ikAVmG0+shTRvLoX5uZZ8c34mwPmper+1D3y2/ZwPMaZu2u+IwPGz
         0jUOHwJzugyyeRMWRZtRcumNzjL1K2LgC+L5iYmg3OQaUxmVs0IicZDIaAEad4Uf0MfW
         tg8mUrwutLv/Ii9Gy4RSwM9uhzp7RjVKPzn0+WptkXnBy0WhzWKx5dNvoQ7hLJXDDynD
         FOnrs7VDt8tAgtu2pDPFZ3/xY7dfpws0iYjvMmgRi9oKKSY+Lb9+m/NwVrh/MHDO4Zkn
         PB3w==
X-Forwarded-Encrypted: i=1; AJvYcCWyHCzP3Ij+pJvaPf6uwc/G4V2NDSVQCfrHiNODeh4VtdI6jLIT7mne8nPg8iz+Uzgd674G6Cg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwvWkUM6MhpUkFdrFXgqi/5SHysu7lQHmMBtHpyW49HGMtrOcnb
	b403KL4tL/NI0Jzx5kzNKe6xs/xKlK6q/Wy7jHD0CH4iMkb9W/g1tBNo+6gBSX353rcEJMdnxtA
	GFEAUINKQEHZHhZosUlQmsft5OYFAqIo1oq7UXBoDP9ryi292hZEZajA7Lblobj2S
X-Gm-Gg: ASbGnctbeaYrzpX/1HWhmq2iU1+ol9LZvvhD4FqkX3eQRdXJixUdsWsWPArLt2DXHR2
	9IvHI8oCB7bke0SxcF6LB9oSGJn2WK4Ko8eownoTFEtwnFE8t1dxftkgmsyCMNGiBiB4qP/nlNF
	8K0FlDBPtXQOA2867nZRYn70AzMqpU3f41lucs4NejEAm90Yt9Maj3WxuegmqYFczB1KF+9vN1F
	I/XIsYR1fpZgybYYX9KK65CnekMuzR9LtZcez9EYEeK1U1itpBruuQAh11ofpPRgXjhlmhRVCMl
	HZdlobJBQSLU3L8O2a9nsl5/roa8mQ36vjUubNdkIpt3mmmTRjp5
X-Received: by 2002:a17:903:3c47:b0:235:5a9:976f with SMTP id d9443c01a7336-23ddb2f2db9mr46315375ad.24.1752064289651;
        Wed, 09 Jul 2025 05:31:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjreNNXd3+SYHL4S/oHX+L23Vo5LZefCgSCCamZIx++CFBdFw3mmJOU4Ve8ksAGPCCBqWoEg==
X-Received: by 2002:a17:903:3c47:b0:235:5a9:976f with SMTP id d9443c01a7336-23ddb2f2db9mr46314845ad.24.1752064289178;
        Wed, 09 Jul 2025 05:31:29 -0700 (PDT)
Received: from [10.218.37.122] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8431e2c5sm139239055ad.39.2025.07.09.05.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Jul 2025 05:31:28 -0700 (PDT)
Message-ID: <2a18cf9e-1dd2-4e09-81f4-eb1d07324c8e@oss.qualcomm.com>
Date: Wed, 9 Jul 2025 18:01:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 06/11] PCI/ASPM: Clear aspm_disable as part of
 __pci_enable_link_state()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250609-mhi_bw_up-v4-0-3faa8fe92b05@qti.qualcomm.com>
 <20250609-mhi_bw_up-v4-6-3faa8fe92b05@qti.qualcomm.com>
 <qo6mb3qlt3xpuvhepwcv6be4wd53neee2t6buzk4tdiy22xsub@vu7lykp3rnu2>
 <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <226bab3a-54e5-94ad-9d84-0b82f9dc4e2f@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Ar7u3P9P c=1 sm=1 tr=0 ts=686e6123 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=WFThVEArfCvG9L-vA9EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: IvJJUzgUPSz9CQ-qcEVM-Z-OMeCSrgna
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA5MDExMiBTYWx0ZWRfX1H9fLt5BMw5R
 mQhzD3wJbLjSDlVv6G7Mh67Mmew/A2/kN40klCtX2oUZy2XAUZUaerzuWiUmitERpbPNYVlmOzz
 iNaLmZWfRtxOcDjsAcII4yTv7a0kR2867eTOvn6SVex6IxhaV41o4U7Lj+dp1kzosL+lg0fYEd1
 7GDvPnY8I0EYBrWo8RD2JhG/P8IqKJgIGoajl6/IxU6FVVgycZjsHmdmoc1i1dzvX0Y0jVvb0zD
 C9Kx2zDsFG0VWQ2CMlZhjk956hFx44ezJcHQ/qlV8XMS6O9thmpS46xnVcnjXKsuB4GphKX7LRW
 AWTKjUwIyJngqXosYWRcz3WMhri3RAWuAGjt2/UhVbvUVmF2jcE5Odiv5XuRiyxK1oJkPohVchR
 ehDV41alXrSxiQyds881sV4o6RHBkxf9nxsjy4v02NvXIC0fw2nSueRq4M4h0vKui5l341Ia
X-Proofpoint-GUID: IvJJUzgUPSz9CQ-qcEVM-Z-OMeCSrgna
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_02,2025-07-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 phishscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507090112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_053132_507553_E09F02BC 
X-CRM114-Status: GOOD (  33.76  )
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



On 7/9/2025 2:40 PM, Ilpo Järvinen wrote:
> On Tue, 8 Jul 2025, Manivannan Sadhasivam wrote:
> 
>> On Mon, Jun 09, 2025 at 04:21:27PM GMT, Krishna Chaitanya Chundru wrote:
>>> ASPM states are not being enabled back with pci_enable_link_state() when
>>> they are disabled by pci_disable_link_state(). This is because of the
>>> aspm_disable flag is not getting cleared in pci_enable_link_state(), this
>>> flag is being properly cleared when ASPM is controlled by sysfs.
>>>
>>
>> A comment in pcie_config_aspm_link() says:
>>
>>   /* Enable only the states that were not explicitly disabled */
>>
>> But the function is called from both aspm_attr_store_common() and
>> __pci_enable_link_state(). So I don't know if this is behavior is intentional
>> or wrong.
> 
> Hi,
> 
> I think it's intentional. Whether the behavior is useful is another good
> question but the current behavior aligns with the explanation in the
> comment.
> 
> My understanding of the situation is:
> 
> pci_disable_link_state() and pci_enable_link_state() are not symmetric
> despite the names, never have been (this is one of those many quirks ASPM
> driver has which should be eventually cleaned up, IMO).
> 
> It might be appropriate to rename pci_enable_link_state() to
> pci_set_default_link_state() to match the name to its functionality (and
> the function comment):
> 
>   * pci_enable_link_state - Clear and set the default device link state
> 
> Note: "the default ... link state".
> 
> 
> I've already raised this concern earlier! As you see, my comment are
> not getting addressed. I'd like to see the author does one of these:
> 
Hi llpo,

I replied to your comment on v3 patch[1], and I feel instead of having
new function() we can use same API to our purpose.
> 1) Renames pci_enable_link_state() to pci_set_default_link_state()
> 
> 1b) If pci_enable_link_state() is still needed after that, a new function
> is added to symmetrically pair with pci_disable_link_state().
> 
> or alternatively,
> 
> 2) Changelog justifies very clearly why this change is okay with the
> existing callers. (And obviously the function comment should be altered to
> match the functionality in that case too).
> 
> If approach 2 is chosen, it should be very carefully reviewed when it
> comes to the callers.
>
I am in favor of approach 2 which you suggested, but lets wait for other
reviewers feedback on this. Based up on the response i will make
necessary changes in v5.

[1] 
https://lore.kernel.org/all/b3d818f5-942c-1761-221d-af7d7e8f3624@oss.qualcomm.com/

- Krishna Chaitanya.
> 
>>> Clear the aspm_disable flag with the requested ASPM states requested by
>>> pci_enable_link_state().
>>>
>>> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
>>
>> Fixes tag?
>>
>> - Mani
>>
>>> ---
>>>   drivers/pci/pcie/aspm.c | 1 +
>>>   1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
>>> index 94324fc0d3e650cd3ca2c0bb8c1895ca7e647b9d..0f858ef86111b43328bc7db01e6493ce67178458 100644
>>> --- a/drivers/pci/pcie/aspm.c
>>> +++ b/drivers/pci/pcie/aspm.c
>>> @@ -1453,6 +1453,7 @@ static int __pci_enable_link_state(struct pci_dev *pdev, int state, bool locked)
>>>   		down_read(&pci_bus_sem);
>>>   	mutex_lock(&aspm_lock);
>>>   	link->aspm_default = pci_calc_aspm_enable_mask(state);
>>> +	link->aspm_disable &= ~state;
>>>   	pcie_config_aspm_link(link, policy_to_aspm_state(link));
>>>   
>>>   	link->clkpm_default = (state & PCIE_LINK_STATE_CLKPM) ? 1 : 0;
>>>
>>> -- 
>>> 2.34.1
>>>
>>
>>
> 

