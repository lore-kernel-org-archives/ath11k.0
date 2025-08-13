Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2E4CA0EC4
	for <ath11k@archiver.kernel.org>; Wed, 13 Aug 2025 03:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL73GNJKLk9gxYhZAyNJw/OghTTtC6l/WSrfhqhdCug=; b=rRTIAb/GiQFWIBvSlYnzcwqJkg
	WWUIxuDJ2kH94qe4bMdtIbLhDYiL5d+4d2aIrMtQhwdGN0U4I7eJZYjBc4TWfFVjo4j/qsvqOSFhx
	WMQnQhX47LpaeVe2yFSZUKkicjFO2nuCgJzdS7PtKJ+cQyl/VsgvYUX5LD9HiSjTWoQXO3xxsjuLz
	1uIYOOcMxEodg9NC7bp0FRuSx1watfvGSf9Wngy7pcGW+NfqbslkL8l61TG3Eam/CjEoDhiYpY1Nm
	mtihQZU0cZRErLBhzX4Ek1zzrQfna3W5XTSOm8KICrqUe8HnXaxxe7iJH6dRe65OCJWI6gqMb+cG8
	1YyBtB9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um2a4-0000000CXt4-3hjR;
	Wed, 13 Aug 2025 03:55:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um2a2-0000000CXsO-0wT4
	for ath11k@lists.infradead.org;
	Wed, 13 Aug 2025 03:55:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nfvm029467
	for <ath11k@lists.infradead.org>; Wed, 13 Aug 2025 03:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nL73GNJKLk9gxYhZAyNJw/OghTTtC6l/WSrfhqhdCug=; b=MzoMEIEPMWSVoNUJ
	3sk0aj2VjkqD3b8AyFo6WpEwt8aIVsj4ufroqT3KgThb9nUcDLnfknXUywqb0bif
	jmlCYgJduTOO2IfnHo+PtlO9nwL3z8Xylhf2EFCrE9e0+Ik/45GhJihZqtBptd7S
	LEHKIewo8ZpbSfIiDVo7LcWkaaFump4j4z1DiqqCHuPNexgS0bMwWB8VHS5i9IuH
	1ltASY2fCZ9XrwK9+PDBJc+gFLL4G6yHyxjSirc5jqwrA9c54IBNnVw+hvf1cluq
	bNN9c4oLcG3HtzWd2t1y0ArTQG+4b2mHkhFcPTRalnIJK+8SaTDBn8y+E6TtYFVD
	O+LvzA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhx8gya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Wed, 13 Aug 2025 03:55:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31f65d519d3so11650988a91.2
        for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 20:55:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755057312; x=1755662112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nL73GNJKLk9gxYhZAyNJw/OghTTtC6l/WSrfhqhdCug=;
        b=Fn3h2sSbh1S7ODjabU79icoUm6x3v1jq0HJiRjSdWjK4OWE4p8CZBQtGc1q0wJg7Ry
         9+OJQe0FRJ8oo3I3CiwRvduA4E306tmQDpmDN0fuVAAkef7Y2To2Z+F/dYYNTcMiasq5
         Vqud31e0X9P9kOHcbX2FubUJstJ//4HX2RcPD6XNCHyZW+CHVaUy3dZaf7rXoDIwal4K
         AnJpGc9vLblp4Wr+s6HOgQHI8zdQdPeeW9IQ2wHpVpKeJx2BfIO8XGqJ8kdiLppypNa1
         +xHkgzJOzzTJUOK3eN+v7nNnMsJSc2CZq9nQ0HcNJuRZU44slk+TDpAxA3mdMAhQ4X6e
         +fjw==
X-Forwarded-Encrypted: i=1; AJvYcCWgS8jTPjg/aZqcj+YWQroXeZMRsZFiUQzVhP6B6PvLNNJeHQSA+TxKYULfK8gYKRsXum/cMsI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfCV72Hj0yM1V7PW6yhpXGXGV929Qn4fMOSjcGY50bH5xVW890
	pKpfvrFlaxbiC2VhGXCO5CgqzKiMc88sRW8jMkm/6N3Ag4Ru5YcnvyGYXf+t1V+uGlqOFF5svuR
	7YME5pe+DjsnzmlrbSx3tI4tGEO6OVFAeroQnuMJbVqWMBJQD0UBuxhYXwLPLPgWs
X-Gm-Gg: ASbGncs52B4DlmLgnFoj+4b9t74na+sQ8+mhiTxAmsOix3uFcbv21xLw4dXYhNW/CZx
	EN0Os6fTD1+3xWFnbpKKzu4iF96pctWRey7TWEUkjD8XVjpdDWnUbpj4fkSx+YRayOkXwWAbqPc
	cjlz/8jKiK762I9JJ76ue6UYpYMbI4aJV3KKsaGOPW9X5Rxg0G/2abx8SwJbuwXmmIcVkIdy3dD
	bsqbRETOAtC5fzBG8g/55ui8WzY6igVY1LkTp6QiUT3iXdMrnuOgM0rcnRUr4u1RlTVW0MLhVhG
	o0s3ZFd1ZJRhvNMjnf2StM4+K+yEocjj37o76Nf/2Mdpu06GDoV7EbFgUSNIbVdz6XKwn/1Y7g=
	=
X-Received: by 2002:a17:90b:2808:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-321d0da48c2mr1826583a91.13.1755057311376;
        Tue, 12 Aug 2025 20:55:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6DBH2kfzGflZ64cNW7+2CaKUESotFcZzef6cAyZ1L/M83j5cwOGYdfHt9J3/vXq3xPUnICQ==
X-Received: by 2002:a17:90b:2808:b0:311:a4d6:30f8 with SMTP id 98e67ed59e1d1-321d0da48c2mr1826528a91.13.1755057310792;
        Tue, 12 Aug 2025 20:55:10 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321d1db5da0sm668773a91.16.2025.08.12.20.55.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 20:55:10 -0700 (PDT)
Message-ID: <ec0e3b33-76f4-4ad5-8497-5c8c8b42f67e@oss.qualcomm.com>
Date: Wed, 13 Aug 2025 09:25:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jingoo Han <jingoohan1@gmail.com>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Rob Herring <robh@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
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
 <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <ycbh6zfwae3q4s6lfxepmxoq32jaqu5i7csa2ayuqaanwbvzvi@id4prmhl3yvh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX/e3bBu9ukpi5
 5cBSlfSpdC3F2iSe9VL50sDN9gAm/ZfEN7ZcHtRc8RhHD94w//WtZRFRHz9Amr8Kslz9u6ykydl
 QiW8G0nii4uA0ZsVcU9tZ2fSfxQZT3gwqeiOpRAz8xDj5bO7W+LDRM7itzG0N/XNTb2iJ62g9pu
 VKVSz7eFPZT24C3To0cjUOqF0i9UJttspDuJGZPWpsbeEEyK5OP9242q9xZjwsI4h5uqvb+aRFb
 sAtEhiSXGWV14/eexAocpLaKWNXn/dfTKN8ZWMf1jcxguOjaqoz8CkRlYyI8zs+pmJPLCL9WUGQ
 sDT/n4e+6ojXYgsAhCzdIQMCCOStYY1eIpbRbbEdXibHVnlT4TuzIosHPbfA1JxqPocC+6PEJnU
 etfH3Qi+
X-Proofpoint-GUID: b2bW1OT0sfPcSmK9KxaVERGv-meAJgSz
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c0ca1 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=Rc7TGh9G46w0mRT8ouYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: b2bW1OT0sfPcSmK9KxaVERGv-meAJgSz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_205514_382091_A48E07FA 
X-CRM114-Status: GOOD (  33.09  )
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



On 8/12/2025 10:13 PM, Manivannan Sadhasivam wrote:
> On Tue, Aug 12, 2025 at 09:35:46AM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya
>>>>> Chundru wrote:
>>>>>> If the driver wants to move to higher data rate/speed than
>>>>>> the current data
>>>>>> rate then the controller driver may need to change certain
>>>>>> votes so that
>>>>>> link may come up at requested data rate/speed like QCOM PCIe
>>>>>> controllers
>>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>>> based on the final data rate.
>>>>>>
>>>>>> Some controllers also may need to update their bandwidth voting like
>>>>>> ICC BW votings etc.
>>>>>>
>>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>>> before & after the link re-train. There is no explicit
>>>>>> locking mechanisms
>>>>>> as these are called by a single client Endpoint driver.
>>>>>>
>>>>>> In case of PCIe switch, if there is a request to change
>>>>>> target speed for a
>>>>>> downstream port then no need to call these function ops as these are
>>>>>> outside the scope of the controller drivers.
>>>>>
>>>>>> +++ b/include/linux/pci.h
>>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>>        void (*release_fn)(struct pci_host_bridge *);
>>>>>>        int (*enable_device)(struct pci_host_bridge *bridge,
>>>>>> struct pci_dev *dev);
>>>>>>        void (*disable_device)(struct pci_host_bridge *bridge,
>>>>>> struct pci_dev *dev);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to update ICC BW
>>>>>> votes, clock
>>>>>> +     * frequencies etc.. for the link re-train to come up
>>>>>> in targeted speed.
>>>>>> +     * These are intended to be called by devices directly
>>>>>> attached to the
>>>>>> +     * Root Port. These are called by a single client
>>>>>> Endpoint driver, so
>>>>>> +     * there is no need for explicit locking mechanisms.
>>>>>> +     */
>>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>>> +                     struct pci_dev *dev, int speed);
>>>>>> +    /*
>>>>>> +     * Callback to the host bridge drivers to adjust ICC BW
>>>>>> votes, clock
>>>>>> +     * frequencies etc.. to the updated speed after link
>>>>>> re-train. These
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
>>
> 
> No, moving to 'pci_ops' is terrible than having it in 'pci_host_bridge' IMO. If
> we want to get rid of these ops, we can introduce a quirk flag in
> 'pci_host_bridge' and when set, the bwctrl code can disable/enable ASPM
> before/after link retrain. This clearly states that the controller is quirky and
> we need to disable/enable ASPM.
> 
> For setting OPP, you can have a separate callback in 'pci_host_bridge' that just
> allows setting OPP *after* retrain, like 'pci_host_bridge:link_change_notify()'.
> I don't think you really need to set OPP before retrain though. As even if you
> do it pre and post link retrain, there is still a small window where the link
> will operate without adequate vote.
> 
Hi Mani,

we need to update the OPP votes before link retrain, for example if
there is request  to change data rate from 5 GT/s to 8 GT/s on some
platforms we need to update RPMh votes from low_svs to NOM corner
without this clocks will not scale for data rates 8 GT/s and link
retrain will fail. For that reason we are trying to add pre and post
callbacks.

- Krishna Chaitanya.
> - Mani
> 

