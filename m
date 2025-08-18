Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1947CA0EF5
	for <ath11k@archiver.kernel.org>; Mon, 18 Aug 2025 13:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D8DSjaS6Nzqt4Y1X63RBdfnA4n1R0NNiVWDomfR+v5s=; b=26UqbYp8v9GWGwqAPs1STJDrdL
	hwO/8RkABieDToDn/ytm3I49MyvvYndbSArdet/oMVlQzV0yR8mGISnCHfjY/WWAWJgrZ5PQTnEON
	Zq7PdGY3j9d4nmzn4qbqOPnWK8QtffDFckflsEoQB/h0vlfV3K8GOMSevecTIs3lOmOSARd4P2Ha3
	jr2MKOoZVoZ2EsyXID3oO3aYaluwjdz3LHdxc2mL2krRKVHVLUSAqk1wHUVwdPlMw4039G9nCfOpD
	9gCp6Cxbg2X2fjxdZRyFzrxLF1ugPf3zh7gRrTXNKuRZo4IowpFj908pNQ9eoI2AEbpzsZpMJ+0hB
	DlfdIFmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo012-00000007T4U-2K4D;
	Mon, 18 Aug 2025 13:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unufF-00000006qiu-2TS5
	for ath11k@lists.infradead.org;
	Mon, 18 Aug 2025 07:52:23 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I0BIIe011948
	for <ath11k@lists.infradead.org>; Mon, 18 Aug 2025 07:52:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D8DSjaS6Nzqt4Y1X63RBdfnA4n1R0NNiVWDomfR+v5s=; b=CDWxzdKw3ksLzHI1
	QAI6u8TdkTkW49JYAqt6s1P9wlxFrq2ZLt85SuVIsChDo71+97r7wjxelxBud3sv
	1khQvu6V6dICgkN8NeKYp4nl6hi18WGWH7o5r152I5caoIvKxB1Da3C9WE/ChniD
	ACBLMq7Arkz64RNscnslUjO0inkz8AmPJeCptzoODXQ4AJ/bO6cYls26jlXxx0Gk
	W3gIXTr8cYLWSH3/JE+ooe5ENTb82MRMtcw698vX8aPgVOPwqPTGhf5KokvxIOWC
	QvtzWzAtoJxFm7/nJzPugS341qeoPcMhJ14r7XMCLJSWU7Fh4UF9pEIEXEhU4WqJ
	aEPPiw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99kq2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Mon, 18 Aug 2025 07:52:20 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-323267bcee2so3674216a91.1
        for <ath11k@lists.infradead.org>; Mon, 18 Aug 2025 00:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755503540; x=1756108340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D8DSjaS6Nzqt4Y1X63RBdfnA4n1R0NNiVWDomfR+v5s=;
        b=RWAdwXDCWXCqeuzXVFrZc6tIfcuoWdj8CVrF6rxky6MSni84jtKCyAZ84FfbGaff47
         WE2cwUM/SZiJRC150jws6Vd8pVgnzQEGmUZvwizhavkuoov808KCzw9U2fNgKHEbunyD
         buupd09R02Q6s9dMneq9/2Dh32YwasKd6Hblh6Ju4BZFVT6ORQZ5xXuIGRznTKhXR5SK
         nPfMcDVEt+zG5fGecm8rfGBPrANWbQS8TA+V+WeKckUXbu+1QZQffmSjX99D58k7a7Ak
         eQl7eql9N3S0thwVTd5tThZri/y192ZSzuX+ehxBGIe9VRGbpYgCdSNJtfjAILHiAN5r
         TW4w==
X-Forwarded-Encrypted: i=1; AJvYcCWrfKip+ez/gXRjCro5Ixj/WNcaz+Zxy/P9CDNK467z1sqz9qyIHtVj46o1+tC5CISISEHfooM=@lists.infradead.org
X-Gm-Message-State: AOJu0YySqwjspkVQwf9e8QiLtaSE/DWAtBvrpw7GFjEg8yNDJQisuPXh
	YbSslgrhjCqGEZZhDAtdazClH2+N24Qtvib/7ic0/bj8Qfb2IwCenFsDuSrqIhg34dIFzmlFb77
	kyZX3BZo9wBdyAsgFUVV0L5N8JYmI6LBMsaZL8+sJfhRtn21Htc/u0o/qRCBLcH4I
X-Gm-Gg: ASbGncsw9KUX5Mp9ySnxVs5su9YD+x4Fq2Kx/ecHId/Qi7WDIodvUMRJRpb7E/z9fHC
	Aailtatt7BWLjsHp8yCY/APf1SmcNAN45WJyasYfgeHl8hpxnmvHjvaDW74lVluCiFKZkGsbLTY
	eVG7BopbAXEWCUWaz0QK7TVn2tWzAnwee/VZqhhsaC1+geoH9YCXX80grLyOQncjBXEzQnNSKkL
	O1dGwfWHrQeVLejXlIRonjR+Hj+Nx6y2tVCI3NQ1ID1PIrVUwS8qE0HzxUu8Yx8sR5G3Ant24yd
	WVd/K+vd5Otc0AQBy79CMyhXk7WARiYuIvx/aYmotJNesZVtPwLRJXHmcvrIZrdilocUxfj4Dw=
	=
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr15208481a91.25.1755503539588;
        Mon, 18 Aug 2025 00:52:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv2ygM0PYT7FNcy0ZmFqjfoVjQ4GvBdacyoCcKsAMMiTB8lssJGuToO/HUfO1DKh2BZxqgnA==
X-Received: by 2002:a17:90b:180d:b0:321:7a2f:985d with SMTP id 98e67ed59e1d1-3234216190bmr15208447a91.25.1755503538964;
        Mon, 18 Aug 2025 00:52:18 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b474e146654sm530414a12.34.2025.08.18.00.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 00:52:18 -0700 (PDT)
Message-ID: <378d4f1e-ade1-4549-ae15-f15d387876a3@oss.qualcomm.com>
Date: Mon, 18 Aug 2025 13:22:11 +0530
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
 <ec0e3b33-76f4-4ad5-8497-5c8c8b42f67e@oss.qualcomm.com>
 <mrsdwtzz7x6uuoakjr6kymqccfxs3lndplols7j33apbru7jii@tjdljisgaqny>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <mrsdwtzz7x6uuoakjr6kymqccfxs3lndplols7j33apbru7jii@tjdljisgaqny>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vPOyfiyAujzDFfWdkPHDWA3eh6QmAYbs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfXyaFCKt1cGilR
 UkX0oF/RjxGE8vpkI+jhJkiWgFdFTA1L45hrXSjFMdeU7b66pYAMf0tBjQRFG1YHq41dwxoH1+x
 LqZa9l66AkwdilDfqOk5z0ljPRGh5osOESgRVfBvuzzeEsQviJSvJj4fh0xbdDbV/GxCoLIEpav
 Wu7Paf0VnBC2jVoSy/jh5I1qYQBvZA0jMxOnjACGeeygk1jo93jH/AubBEfRSJaP2RWbgcp2d23
 E4NqF1IADCO6dsDhOpQF+hRHw+SW0bZH/Etf4Gmvh2lV9GZpsTW3kw/F0omxfX765I/w/b43ZBR
 kU2dTIyem2qzulEKfO+HJX+zfNnAToz5EOol2yEeSz9ak+huhLJ4QEuGN326pEwS8VLAq8y6x3A
 47vW0+bU
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2dbb5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=-mV2PR8Q5cfizQaz2gsA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: vPOyfiyAujzDFfWdkPHDWA3eh6QmAYbs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_005221_672733_80C3D9CC 
X-CRM114-Status: GOOD (  30.52  )
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



On 8/18/2025 12:39 PM, Manivannan Sadhasivam wrote:
> On Wed, Aug 13, 2025 at 09:25:03AM GMT, Krishna Chaitanya Chundru wrote:
>>
>>
>> On 8/12/2025 10:13 PM, Manivannan Sadhasivam wrote:
>>> On Tue, Aug 12, 2025 at 09:35:46AM GMT, Krishna Chaitanya Chundru wrote:
>>>>
>>>>
>>>> On 7/22/2025 4:33 PM, Krishna Chaitanya Chundru wrote:
>>>>>
>>>>>
>>>>> On 7/12/2025 4:36 AM, Krishna Chaitanya Chundru wrote:
>>>>>>
>>>>>>
>>>>>> On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
>>>>>>> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya
>>>>>>> Chundru wrote:
>>>>>>>> If the driver wants to move to higher data rate/speed than
>>>>>>>> the current data
>>>>>>>> rate then the controller driver may need to change certain
>>>>>>>> votes so that
>>>>>>>> link may come up at requested data rate/speed like QCOM PCIe
>>>>>>>> controllers
>>>>>>>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>>>>>>>> link retraining is done controller drivers needs to adjust their votes
>>>>>>>> based on the final data rate.
>>>>>>>>
>>>>>>>> Some controllers also may need to update their bandwidth voting like
>>>>>>>> ICC BW votings etc.
>>>>>>>>
>>>>>>>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>>>>>>>> before & after the link re-train. There is no explicit
>>>>>>>> locking mechanisms
>>>>>>>> as these are called by a single client Endpoint driver.
>>>>>>>>
>>>>>>>> In case of PCIe switch, if there is a request to change
>>>>>>>> target speed for a
>>>>>>>> downstream port then no need to call these function ops as these are
>>>>>>>> outside the scope of the controller drivers.
>>>>>>>
>>>>>>>> +++ b/include/linux/pci.h
>>>>>>>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>>>>>>>         void (*release_fn)(struct pci_host_bridge *);
>>>>>>>>         int (*enable_device)(struct pci_host_bridge *bridge,
>>>>>>>> struct pci_dev *dev);
>>>>>>>>         void (*disable_device)(struct pci_host_bridge *bridge,
>>>>>>>> struct pci_dev *dev);
>>>>>>>> +    /*
>>>>>>>> +     * Callback to the host bridge drivers to update ICC BW
>>>>>>>> votes, clock
>>>>>>>> +     * frequencies etc.. for the link re-train to come up
>>>>>>>> in targeted speed.
>>>>>>>> +     * These are intended to be called by devices directly
>>>>>>>> attached to the
>>>>>>>> +     * Root Port. These are called by a single client
>>>>>>>> Endpoint driver, so
>>>>>>>> +     * there is no need for explicit locking mechanisms.
>>>>>>>> +     */
>>>>>>>> +    int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>>>>>>>> +                     struct pci_dev *dev, int speed);
>>>>>>>> +    /*
>>>>>>>> +     * Callback to the host bridge drivers to adjust ICC BW
>>>>>>>> votes, clock
>>>>>>>> +     * frequencies etc.. to the updated speed after link
>>>>>>>> re-train. These
>>>>>>>> +     * are intended to be called by devices directly attached to the
>>>>>>>> +     * Root Port. These are called by a single client Endpoint driver,
>>>>>>>> +     * so there is no need for explicit locking mechanisms.
>>>>>>>
>>>>>>> No need to repeat the entire comment.  s/.././
>>>>>>>
>>>>>>> These pointers feel awfully specific for being in struct
>>>>>>> pci_host_bridge, since we only need them for a questionable QCOM
>>>>>>> controller.  I think this needs to be pushed down into qcom somehow as
>>>>>>> some kind of quirk.
>>>>>>>
>>>>>> Currently these are needed by QCOM controllers, but it may also needed
>>>>>> by other controllers may also need these for updating ICC votes, any
>>>>>> system level votes, clock frequencies etc.
>>>>>> QCOM controllers is also doing one extra step in these functions to
>>>>>> disable and enable ASPM only as it cannot link speed change support
>>>>>> with ASPM enabled.
>>>>>>
>>>>> Bjorn, can you check this.
>>>>>
>>>>> For QCOM devices we need to update the RPMh vote i.e a power source
>>>>> votes for the link to come up in required speed. and also we need
>>>>> to update interconnect votes also. This will be applicable for
>>>>> other vendors also.
>>>>>
>>>>> If this is not correct place I can add them in the pci_ops.
>>>> Bjorn,
>>>>
>>>> Can you please comment on this.
>>>>
>>>> Is this fine to move these to the pci_ops of the bridge.
>>>> Again these are not specific to QCOM, any controller driver which
>>>> needs to change their clock rates, ICC bw votes etc needs to have
>>>> these.
>>>>
>>>
>>> No, moving to 'pci_ops' is terrible than having it in 'pci_host_bridge' IMO. If
>>> we want to get rid of these ops, we can introduce a quirk flag in
>>> 'pci_host_bridge' and when set, the bwctrl code can disable/enable ASPM
>>> before/after link retrain. This clearly states that the controller is quirky and
>>> we need to disable/enable ASPM.
>>>
>>> For setting OPP, you can have a separate callback in 'pci_host_bridge' that just
>>> allows setting OPP *after* retrain, like 'pci_host_bridge:link_change_notify()'.
>>> I don't think you really need to set OPP before retrain though. As even if you
>>> do it pre and post link retrain, there is still a small window where the link
>>> will operate without adequate vote.
>>>
>> Hi Mani,
>>
>> we need to update the OPP votes before link retrain, for example if
>> there is request  to change data rate from 5 GT/s to 8 GT/s on some
>> platforms we need to update RPMh votes from low_svs to NOM corner
>> without this clocks will not scale for data rates 8 GT/s and link
>> retrain will fail. For that reason we are trying to add pre and post
>> callbacks.
>>
> 
> If we are targetting OPP only, then can't we do direct OPP setting from the
> bwctrl driver itself? Or we also need to set ICC votes directly also (in the
> non-opp case)?
we are targeting only OPP, I can directly call OPP API's from bwctrl
driver.

As recommended, I will try to introduce a quirk flag in pci_host_bridge
to enable and disable ASPM before & after retrain. And will call OPP
API's in bwctrl driver itself.

- Krishna Chaitanya.
> 
> - Mani
> 

