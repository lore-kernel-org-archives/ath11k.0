Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61CDECA0EDA
	for <ath11k@archiver.kernel.org>; Tue, 12 Aug 2025 12:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1XZQXAHzUdSPrv2me7BRJkLC13h5rEiUYCH9W9cUAY=; b=kBlXOEipXa5F1/LyUbt7r8jLln
	admwpe3uxfr9hgs6BGpCyBa1nS+2Qw9tAHZdFfjYzwMLgNNFCUH08jYH/Yt0/Tm15W2l9D6noiREt
	NViMXTSJqS6bb2YFLb0jtH/+/1YRi9WFHbU4A/CtTijj5i9Z/F8KVcpI5VvOkNNf3oxh1Qg1/9x8u
	KZzLdwp2rNiHSqFOMqSUEOAtvW/k782XylRL9BTfprUI+/qltIaQ8PPXQi07B/VThraDxTBskXevw
	4VEcerx9aKBtmBXxO55od884reTCKO5LuvwnxwBgPl08xTm8lYv307wwikXZhBEzCJQ19uQosAPUg
	vF5fuRXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloJ6-0000000AnoJ-2j5i;
	Tue, 12 Aug 2025 12:40:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ullHv-0000000ANfm-1Sfn
	for ath11k@lists.infradead.org;
	Tue, 12 Aug 2025 09:27:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C5bQUI024551
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 09:27:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x1XZQXAHzUdSPrv2me7BRJkLC13h5rEiUYCH9W9cUAY=; b=Llb51V61WCalqt3U
	csS5zlgRdsQaP9rirsXjehj9wFrRWoIpzwoN3a/ZvbQW6GSOFCKjVihIPpyiLtvi
	6ZvbckxLxMKjQliSiJ5d3aWZd/ToSK0xFP7AHWe2q5D5k5ltLLIEOyPyMIXtEcY8
	fF8Tkw12wXduLk07blc+IsIOn7Yf8XNNYMmPkxfVbBN8fIR4FH++rtxie/14+M8q
	cM2J/wm2q+gUKlWjcss4eTuc6D7iq9ukljkMQeLGpkLYLAj9jl176Z+z48HFvego
	XiIVlxp/hdhgqgcOoR0AzSl6mbmx5ixHr1ImmmGtd7N6Zt4OWa5CcbrCFZwE+wEY
	Ldg+Bw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fem4bk8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 09:27:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70989fdb7f6so15701676d6.2
        for <ath11k@lists.infradead.org>; Tue, 12 Aug 2025 02:27:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754990841; x=1755595641;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x1XZQXAHzUdSPrv2me7BRJkLC13h5rEiUYCH9W9cUAY=;
        b=O/LoZTglHrSfIvbgqAbd2U85n9bcKikWEWyqTQSvxdBwjEodKk4z2tEGAsKICCZnec
         QUCGV64zMF/GESvvHtwVH7JNEVC5puof2sxR7mjghdAzanxt0OH9TQMU6Mz8V5ALD/ls
         HO77rvSQfard82yCvvqP1bxTcwfi4UR5Fd6d0ixwuWBVPlvN/GwPrQ1KQoaujpcn7jKm
         II3qnJFvfnzgWEzuKmz/LQCsAM6eej3EyMbfaTp0aOujFZ9aaJvDIRXP+WRZmrrWgrqr
         u5J05iANBmziGGu9+4pjUi0zEmesQOBQb2h4VkD7gw5zJ5IX0AA/yCuOH97q33vvtJQC
         RFDw==
X-Forwarded-Encrypted: i=1; AJvYcCWWDaUICMG9JkoucqyjgOnkZC+hJtlSIAVNPJSKrNhHAoqOAXjPxIo4e2HKvhwITRpJZgXKti4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvfhxqOLjZZrLOTFLeIv9M3IjYXLYnbqmdpIxt8iSDYuhXvinA
	9WrfC8RyCpxxvFkZ8mYF2gBJYH6PwLUeY0pFShuBnCF0AOcoJDtgFUeRPotuSmN6Hb/C3HhtCX2
	33h7EFnd8YzqttFxTA+ewZKCbI7cRJe4sIexJPD0rH4br3o92ltdTOidPxtKXKd/C
X-Gm-Gg: ASbGncvc2EfC/6uWoT1LLSLIqjXLxtWRDRMvEvzt/dmlFbtaAk8n+dmCQUYGl1USNjD
	xciT27qd/fqJilsmH+EjYrqKIMcV4yozjenXrfpZrYWL1nYOLQmJBJuSn/8BzviWhQwwHWpsDsi
	7MVnURp5wqO+jOhLLSXeMuX6O7xbhj8V9lXP5n5gs/MUPBkDk/WpM1UZaCAV1QeDwNT2PtiVv4r
	2CHohKCY0XD+1X6LXucQOb/1Lyn5y5RnBLD+DgKsCUYRe9/21SVOCu/vDXmxbW5/LoWUknLkwfm
	E1cnfo4PgsgYSzG0lKixo0qQFzaO/mxSfG8ycQYca00sg68FBRic7vmlgiq5DJ+DKf1Zr42g7co
	TNNxsv+r+fstmC0+hdA==
X-Received: by 2002:ad4:5c6d:0:b0:707:4daf:62f with SMTP id 6a1803df08f44-709e250c0f5mr1924956d6.7.1754990840786;
        Tue, 12 Aug 2025 02:27:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJKGm+UhBSlPdpnKeF86J93B+AqDA/p+7hYFKAOley2I+WUeLVMJXey9VyfTdFfRU+b7jZRA==
X-Received: by 2002:ad4:5c6d:0:b0:707:4daf:62f with SMTP id 6a1803df08f44-709e250c0f5mr1924686d6.7.1754990840317;
        Tue, 12 Aug 2025 02:27:20 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2c265sm19700788a12.26.2025.08.12.02.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Aug 2025 02:27:19 -0700 (PDT)
Message-ID: <3939605c-7335-4401-ba32-b88ee900f1d5@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:27:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <68a78904-e2c7-4d4d-853d-d9cd6413760e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Ob94-NbpQdaLieVExM932glzUr2vYq7P
X-Proofpoint-ORIG-GUID: Ob94-NbpQdaLieVExM932glzUr2vYq7P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA2OCBTYWx0ZWRfX034ToW0Dj9+P
 qZGg1VmGVDzDyS3GewQR2AFA8BM6Yy6mQVgr9sGvQQEnkLXtY4SN8gmpQH6pZ3d3RevJjcB15vt
 G8g9qD/saJxNgYVbuUoMFVnfYX3w34UcKfe99lQWZ82tcjTe8l3cXlIyNptHOwJRKgqqag12gYC
 cF4Xd3A9Oi6kRcw2+k51M5qT5f4Fkc2h1S7asBFbp8/3NZdK9NmZeL2gqVk4gOFuWC6beO+ttWB
 1Vt2E1bO8IulSzUPUBYL3c8f26LOL6sInSykYZDD7HsYA5M2pNu/zpOvxvnQMuvB3DAzoxU7GQQ
 wYfS9haN0l9/3GfZMgeZL2KYBs1wJwAqkhGXFn1HfqF2XuuhDVaqFYIEkYaBiCrGvmGeO/hj5Xq
 m3iCELnk
X-Authority-Analysis: v=2.4 cv=YMafyQGx c=1 sm=1 tr=0 ts=689b08f9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=PSSt48hOBszhu4C4aVgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_022723_507613_2DF6A003 
X-CRM114-Status: GOOD (  28.03  )
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

On 8/12/25 6:05 AM, Krishna Chaitanya Chundru wrote:
> 
> 
> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>
>>>
>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru wrote:
>>>>> If the driver wants to move to higher data rate/speed than the current data
>>>>> rate then the controller driver may need to change certain votes so that
>>>>> link may come up at requested data rate/speed like QCOM PCIe controllers
>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>> based on the final data rate.
>>>>>
>>>>> Some controllers also may need to update their bandwidth voting like
>>>>> ICC BW votings etc.
>>>>>
>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>> before & after the link re-train. There is no explicit locking mechanisms
>>>>> as these are called by a single client Endpoint driver.
>>>>>
>>>>> In case of PCIe switch, if there is a request to change target speed for a
>>>>> downstream port then no need to call these function ops as these are
>>>>> outside the scope of the controller drivers.
>>>>
>>>>> +++ b/include/linux/pci.h
>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>       void (*release_fn)(struct pci_host_bridge *);
>>>>>       int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>>       void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>>>> +    /*
>>>>> +     * Callback to the host bridge drivers to update ICC BW votes, clock
>>>>> +     * frequencies etc.. for the link re-train to come up in targeted speed.
>>>>> +     * These are intended to be called by devices directly attached to the
>>>>> +     * Root Port. These are called by a single client Endpoint driver, so
>>>>> +     * there is no need for explicit locking mechanisms.
>>>>> +     */
>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>> +                     struct pci_dev *dev, int speed);
>>>>> +    /*
>>>>> +     * Callback to the host bridge drivers to adjust ICC BW votes, clock
>>>>> +     * frequencies etc.. to the updated speed after link re-train. These
>>>>> +     * are intended to be called by devices directly attached to the
>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>
>>>> No need to repeat the entire comment.  s/.././
>>>>
>>>> These pointers feel awfully specific for being in struct
>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>> some kind of quirk.
>>>>
>>> Currently these are needed by QCOM controllers, but it may also needed
>>> by other controllers may also need these for updating ICC votes, any
>>> system level votes, clock frequencies etc.
>>> QCOM controllers is also doing one extra step in these functions to
>>> disable and enable ASPM only as it cannot link speed change support
>>> with ASPM enabled.
>>>
>> Bjorn, can you check this.
>>
>> For QCOM devices we need to update the RPMh vote i.e a power source
>> votes for the link to come up in required speed. and also we need
>> to update interconnect votes also. This will be applicable for
>> other vendors also.
>>
>> If this is not correct place I can add them in the pci_ops.
> Bjorn,
> 
> Can you please comment on this.
> 
> Is this fine to move these to the pci_ops of the bridge.
> Again these are not specific to QCOM, any controller driver which
> needs to change their clock rates, ICC bw votes etc needs to have
> these.

Do you even need to set the OPP explicitly? The global irq handler
already does so on linkup, and you seem to toggle the link state in
the newly introduced helpers

Now not all DTs currently have a global interrupt, but that's a mass
fixup to be done anyway..

Konrad

