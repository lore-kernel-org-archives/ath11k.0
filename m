Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F3BCA0EC4
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 14:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7n24b5y09554bTu/Veo3VDRFW4pPHKlo+XBhAE2yofU=; b=fui31jVCrhMEPAXONoEZDCnyzG
	fstOQ+EjAVZYY2l9D620P/W+z0uEbWCqxGLmvRmshaompXS7TAenGokzjO/h7gRTcABV+nnh0NREE
	1ax4cNqBUJWMALk0ZrKF0RvtTdgrEiEXvRoC+YV4JPBDCgO1eyEZJUe6/z6dUew0eYF/to6X695Ex
	PLHP3qaY2T0vGdwmhLPirkfOWCqpzQP4+l1J3woKMLEQwRPFCJUAmk7wg2iyynm7KA6BoObzVZtc5
	6PjT1OpydxCi/3tVeAme1GsV0sLHT7TO8yPpaVFWVD7KXlKKSBx42HRS5Bx5DBp1/xMG/ogEI1Hb7
	uRgcc7Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulqMp-0000000B71a-2ctl;
	Tue, 12 Aug 2025 14:52:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullMu-0000000AOMR-35G2
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 09:32:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5n87k024404
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 09:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7n24b5y09554bTu/Veo3VDRFW4pPHKlo+XBhAE2yofU=; b=VRwOt31B+kdwV4Lc
	HbCkN4bGsdbKDoq6E9J/tAgN+Siin1Fd5VRPjlzYzVehmkdAJsl4h6iSzOSXrgo9
	fVmKvsD1M38R6Cf/xtch0CCyZiiUg2QfsrfigToFbGgw99XNnMb2lT1A5/5ZiSF1
	bkzG7EqGv0nNhebOYPUwO1otY1USFEl06+cs+uTGRl0vvmjaGjPvkO+oSivykrk4
	GTaJgm1F7gaVZBYrDbOgrPrP7SzmpiM9tSizkHUmxlQiR5mJrmmaeF6YMPeYe5w2
	3TYEikwPLlve3n2zyT8jNU3143grbvJyoQau1KqR3zY6vB84F442EBSE4RSfu6ia
	ZvSSGw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bkrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 09:32:31 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-240607653f4so46819395ad.3
        for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 02:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754991150; x=1755595950;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7n24b5y09554bTu/Veo3VDRFW4pPHKlo+XBhAE2yofU=;
        b=tSmCkG57H8RU2AEzcjvqZLmC4kefA4G7/ibsJG6hkwlv6/Il0UDOPa4QjrhJqGVpyo
         SBXS+QQdaeoQlan1FuYOeUUY8+HOzXOh7tL3UmlEXK6x+y1qdG4PleBkq2f+SOUgH047
         TUvY7+Y4wb7XzESCvv8J5T8wa/2VdLmitegnHpipaiVcntwSviapXum2wV02l9PU4XoA
         x6la7HAYegGqNz+L4ImrBdzoU1af5MhtrZTnpSFaZ/xOq+JPcy2DMo8e3mlIMscjH6E6
         5QJ47ySBFc6PMFAYfD/nVHn7RwgQRbgPnwRDFhB+7r1Wudir0OXoZgpsorS+6dD8o/lr
         RsAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/XSa4Hn16FifqY8DYbKnZjXl6sZHIITYauOf5JgA5ForXTE4h4N8tC2sviGv6IahsKk28Fgk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwidLjb+iS+85AxRGLO+56y1+qKKhZZHaPX8PLLenFqXaiDeaBs
	4yvCCDpF+YylqFDUJ1OPEvaI0xIArGe0AD0R4guvmTJwD6OM9Z7rmS1tKwlnlBMsS+0LkXex054
	kU3SdmS5o5Rq5VPLCsnudbFbQq0ARxS+lG8KO0ua86JuY7ECxY2RJXALUFn8r3GP0
X-Gm-Gg: ASbGncvA5iCfVfSXhpxpSWl0y4snf517CiMMx8AJp5yaldSURj0KgM28mHYgpYD0s/S
	orSCsmblg+fVzNHWgi9FmobAroc9ELc9/f5nktRmqj4L370tRdaPha1K4H/r992WOl6OZ1gPw1C
	jU3xKcx0+QhG9hpuZywhpnFAqPOFaKi1BnhXpUxIbin5a+pCOXGKrOixlWy9fYk9T5ou9XjNMS2
	gWC/FLe8mk3IIwWoMuIpRN9IaxGKl3+prTuDgasLBi1aIq0BrZOVXoGP0bEQQkF+NqyeDiBfye9
	inDyUYNQ1crOhNl+iBRZI/5/lJuOkUADfVG0AjD4DJn6OclBI7MEgrKKP7yAO5GQRmHENjeOFg=
	=
X-Received: by 2002:a17:902:ef07:b0:243:485:269d with SMTP id d9443c01a7336-24304852b18mr13228395ad.31.1754991150187;
        Tue, 12 Aug 2025 02:32:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9kdodTnnV+PESNDgF1+JEyc7nLGF4AcUeaMfke5Rq0BxrIP5ikbInr31f30kDeqp4lDDApQ==
X-Received: by 2002:a17:902:ef07:b0:243:485:269d with SMTP id d9443c01a7336-24304852b18mr13227695ad.31.1754991149647;
        Tue, 12 Aug 2025 02:32:29 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e8aa9055sm296829815ad.150.2025.08.12.02.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:32:29 -0700 (PDT)
Message-ID: <5dbd782a-1d52-4614-9e7e-3b7d9dfd099f@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 15:02:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Manivannan Sadhasivam <mani@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        qiang.yu@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_vpernami@quicinc.com, quic_mrana@quicinc.com,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250711213602.GA2307197@bhelgaas>
 <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
 <d4078b6c-1921-4195-9022-755845cdb432@oss.qualcomm.com>
 <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
 <3939605c-7335-4401-ba32-b88ee900f1d5@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <3939605c-7335-4401-ba32-b88ee900f1d5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: SxHe-5YmB4-PVflaNLC9aRlsr68I5-xu
X-Proofpoint-ORIG-GUID: SxHe-5YmB4-PVflaNLC9aRlsr68I5-xu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX4U3KGHxqFMtF
 VczAPBnTDN1GCyQEY4fa9pdahGKIW0/iezFa/K+D9HQVbUiJsww2I3DJStgrW6ZXZEL6VKU19np
 zW+8fvroIkn6l2EaPkGKUjuazLUAO/Be8ij1keOvjbbMR4SyY5HL8EPKVWIJtit+m9c/kgSbPn6
 0L6sGH3etu0u5lxXx4lBTgR1H9bmT8r8l3tcBV87R6OQrITYm8lHBr1MXq7flcErS6LL5UVJoEB
 WUvVimHmCRpnv0wtEC8KDIltMedSYFiCjULg01Wq4j0DNfAz/HTvrAI6dhWU01wRCfJ6Nb86pHC
 86DR5zh+BxUWkn5EMsUAENhNPOI3s4vxpQyIX5vbgTXzOQ+0iuXKuo1+4ciFhr2ERJ8IdScsD+Y
 yGTNNNm1
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b0a2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Jnfc8Lo_MkJUCzdN-ZEA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_023232_895058_9F80253F 
X-CRM114-Status: GOOD (  29.72  )
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



On 8/12/2025 2:57 PM, Konrad Dybcio wrote:
> On 8/12/25 6:05 AM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru wrote:
>>>>>> If the driver wants to move to higher data rate/speed than the current data
>>>>>> rate then the controller driver may need to change certain votes so that
>>>>>> link may come up at requested data rate/speed like QCOM PCIe controllers
>>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>>> based on the final data rate.
>>>>>>
>>>>>> Some controllers also may need to update their bandwidth voting like
>>>>>> ICC BW votings etc.
>>>>>>
>>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>>> before & after the link re-train. There is no explicit locking mechanisms
>>>>>> as these are called by a single client Endpoint driver.
>>>>>>
>>>>>> In case of PCIe switch, if there is a request to change target speed for a
>>>>>> downstream port then no need to call these function ops as these are
>>>>>> outside the scope of the controller drivers.
>>>>>
>>>>>> +++ b/include/linux/pci.h
>>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>>        void (*release_fn)(struct pci_host_bridge *);
>>>>>>        int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>>>        void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to update ICC BW votes, clock
>>>>>> +     * frequencies etc.. for the link re-train to come up in targeted speed.
>>>>>> +     * These are intended to be called by devices directly attached to the
>>>>>> +     * Root Port. These are called by a single client Endpoint driver, so
>>>>>> +     * there is no need for explicit locking mechanisms.
>>>>>> +     */
>>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>>> +                     struct pci_dev *dev, int speed);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, clock
>>>>>> +     * frequencies etc.. to the updated speed after link re-train. These
>>>>>> +     * are intended to be called by devices directly attached to the
>>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>>
>>>>> No need to repeat the entire comment.  s/.././
>>>>>
>>>>> These pointers feel awfully specific for being in struct
>>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>>> some kind of quirk.
>>>>>
>>>> Currently these are needed by QCOM controllers, but it may also needed
>>>> by other controllers may also need these for updating ICC votes, any
>>>> system level votes, clock frequencies etc.
>>>> QCOM controllers is also doing one extra step in these functions to
>>>> disable and enable ASPM only as it cannot link speed change support
>>>> with ASPM enabled.
>>>>
>>> Bjorn, can you check this.
>>>
>>> For QCOM devices we need to update the RPMh vote i.e a power source
>>> votes for the link to come up in required speed. and also we need
>>> to update interconnect votes also. This will be applicable for
>>> other vendors also.
>>>
>>> If this is not correct place I can add them in the pci_ops.
>> Bjorn,
>>
>> Can you please comment on this.
>>
>> Is this fine to move these to the pci_ops of the bridge.
>> Again these are not specific to QCOM, any controller driver which
>> needs to change their clock rates, ICC bw votes etc needs to have
>> these.
> 
> Do you even need to set the OPP explicitly? The global irq handler
> already does so on linkup, and you seem to toggle the link state in
> the newly introduced helpers
> 
> Now not all DTs currently have a global interrupt, but that's a mass
> fixup to be done anyway..
> 
Konrad,

global IRQ in the qcom controllers will only come in only on initial
linkup, and later on link speed change through bwctrl driver we will
not get global IRQ.

For QCOM controllers we need to change the RPMH vote for example if
we want to update the PCIe data rate from 5 GT/s to 8 GT/s we might
need to update the RPMh vote from low_svs to NOM corner before we
initiate link up. for that reason we are introducing pre & post
link_speed_change function pointer.

- Krishna Chaitanya.
> Konrad

