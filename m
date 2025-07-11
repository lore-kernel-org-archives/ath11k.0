Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31055C83F1B
	for <ath11k@archiver.kernel.org>; Fri, 11 Jul 2025 23:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eRi2bFv99W7KvrolTDuk12d65vjZCVs5GiO7uLokh1E=; b=GA8uZbwF5OtPWeKwR0eluwtuKQ
	NNQ5ELJGBmdYHImxn0rvqzQ2bApV+5RkIl+l+NKH2LFNKYvFSKFdbzlXKZESZCvWPSo32Mx2JCI76
	qrEnOq0dgAeFKts8r+asRTGPL2hpnjf52IsAqMkpOBRcSZ5+WCtPrhOhGuninpfb5JpmE9wjgIHIi
	ghjmpUJjCux5bXDRndYNr4K3/LpF9bkCkvElp+kNPu3C0pBVxaaPCmdiRDKBfdTmNPyHXkjpiTd8P
	kMABkCT1UovdPm5vBCmOd88d0hOA4hJLisB2xuLl3801w1EQPhWvRyY5NGkUEhglpEgBYQJ84Yr0I
	gUnAbKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMp7-0000000G03A-3DUf;
	Fri, 11 Jul 2025 23:06:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMp4-0000000G01w-2MOK
	for ath11k@lists.infradead.org;
	Fri, 11 Jul 2025 23:06:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BMmbQR008497
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eRi2bFv99W7KvrolTDuk12d65vjZCVs5GiO7uLokh1E=; b=f/T4QJ2AYCB++mb/
	QH3dwnIXdNSUSFPElOYu4mwQ0sIDZUUZK/L5TsGgeZLTGZsGhhg+QSquy+Pdz6RE
	XLCRrcb7iwb3EvR7lUxjBZ6OP0UfrXDVssUa9UlS8+7wz4mx2ngtj+M6kZYUdpYs
	mzvWi9ESdGA0M31LyYLYVRYPrUqrNFQr3Q9IxmC5t1LzqWBTEJGc6PESwOOgni9Q
	3eksdv8bW529+M3oy2EFXWTslCOMGWP/q8HaEyT5GB68TpN174vwSHVMWCcqYyBJ
	gbEiIcpa5Ju02oeVtt/FfSD5Zy3jHzGqSs+VbHwjihBb/wwROboKTS6O3+qN2K0K
	MPOkHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smcga1ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 23:06:29 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so3510138a91.3
        for <ath11k@lists.infradead.org>; Fri, 11 Jul 2025 16:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752275188; x=1752879988;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRi2bFv99W7KvrolTDuk12d65vjZCVs5GiO7uLokh1E=;
        b=K3sK5KOdvtzf94h3hfnkdL9hh+A2H+xz9+6Uf1gPXvJCO6XI3GbtWMXMeZXziwdKdv
         U9b1inlmCS6iKVyr1LFERwldPdkghOppLcRiz+cCKtcf/Zp/UpmhuMH9naTcTaTmfLEz
         LS1GbeDB+IyhtFGwXtsn0Pq1w/9rzIaf9rSj34MfaIk8IP0KvH25SbohthzkaFFYeAJ4
         XJS6FiwNy5CDbc4K8RijmrJUKFLXwxOuHXmvUenn8u9kZ7vA3ifpbOijxIw0hvPdb3gD
         fZB2AFYrrVJ9oYowt6sRBgSFY3bSabypbhTOBicQVHTIHg5rQYM4OggV5yppMOOqOWuw
         wu5g==
X-Forwarded-Encrypted: i=1; AJvYcCUIj3CkxdmrxGea8BK+mKBaWQM8iO5YHl15Ru2F0MAaqQkMeWZgyH8qC5FvBilJPev3rl6hezM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfvAr2rdoXcSAR1Fcph7X2sVtbeGTaZkzlT799SWvtESY1dNR6
	fsq+9NicSQLey+hN4O+cGxLjlsOwHI1tJICdYLu61bPti691LpWdDCZZeLIBwVPu1kZPz1o9r7R
	NOtCneVOKkAZ06lN680csBw1xcjLY45jsG2YVe/7CMwYRE7kKxyMDDF7UzaO9S76F
X-Gm-Gg: ASbGncun6RLGYfzH6ICU9KwRkRI8y28LhsnR1nzw8JVVXpNa1cbvEp+43KsXTSsVswl
	4xODvGhpMGx9UxoIYaU3143tEnUyRxeG+bbgZwNYqg+U6NS2IVFxssJN+Q+y2XXZfmRG/uxrksi
	0J2VmRMz7KDlx2O7SOGJNOMtqJBn0S1m7n9/M/5gWzjZvkD9VjMAER7kF+QFSNQJL3p8sYQCyNf
	xeXethh6+fP9gWr1x2zomOKvOX6HU9P5ffPVF2RKnQtmOx6riJSHho7JEvXweU7qSGlG+EsddSs
	Yigk+TCGQ976PzbNkwmdLls54uqDVyx6Ytc416wi1vqURTAAnPh/twA7qzp1fpYZSAIV
X-Received: by 2002:a17:90b:558f:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31c4f5af641mr6697010a91.28.1752275188342;
        Fri, 11 Jul 2025 16:06:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOA57b5bd6nFUs/a3OF0BCONNKttUzt98H1lAvER5erkT45XFhKpR098tx16zYR8pMEwH+3w==
X-Received: by 2002:a17:90b:558f:b0:312:639:a064 with SMTP id 98e67ed59e1d1-31c4f5af641mr6696957a91.28.1752275187781;
        Fri, 11 Jul 2025 16:06:27 -0700 (PDT)
Received: from [192.168.29.92] ([49.43.227.1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3eb62ef8sm5955644a91.37.2025.07.11.16.06.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Jul 2025 16:06:27 -0700 (PDT)
Message-ID: <55fc3ae6-ba04-4739-9b89-0356c3e0930c@oss.qualcomm.com>
Date: Sat, 12 Jul 2025 04:36:17 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 02/11] PCI/bwctrl: Add support to scale bandwidth
 before & after link re-training
To: Bjorn Helgaas <helgaas@kernel.org>
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
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250711213602.GA2307197@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P7o6hjAu c=1 sm=1 tr=0 ts=687198f5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=4nqOr+EkFiuPl9GB/B4vcQ==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=6PMv1mg6ifOMqnheZnAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ZSRrOQOmH70vNIAbiNO3wOGrl7OlCBXt
X-Proofpoint-GUID: ZSRrOQOmH70vNIAbiNO3wOGrl7OlCBXt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDE3NSBTYWx0ZWRfX2ICLVQ2VMBqB
 LVzIjtSAtZnKhowHqWWeIqjeHQN1mgPqwmWSCzr2AsLtWT2JVEg4fchBt4dE4LPGU6E1As+f6F6
 QVoVsSsN1F27SrDTX/Nz84677B2PKWpp29UyY1Jt9HLVwZyDYv3XWdiiWpzqsvTbK/J/Xl4i/pe
 /EOcADH419aiV/Y/GciVqJkH+hb2Ae7prMxfniI+OupiJOyPekOUkc4EngUiXg5y9aDqASzT1Db
 EF8UrGR2bLyrnDZ019Qb9uhPWbMdZja97/PpAIbgizVou3GTrExusoIcio5z2mF7V5NAi1k0Cf9
 AalpKpvscpEi94NvBRZKtcHUryyvDVkwlf6KqZ6f7o9KYtwzT27YNOfzIYsPC52SBFbhXulldPd
 VY+B5iVY2aOONY6BdEdGDUvcQ0UHNvEMtfwQTOeFLJKeN7GjAJYYCIt2vddp/SJk2BmRUWzu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 mlxscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507110175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_160630_630364_7F04C37B 
X-CRM114-Status: GOOD (  23.32  )
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



On 7/12/2025 3:06 AM, Bjorn Helgaas wrote:
> On Mon, Jun 09, 2025 at 04:21:23PM +0530, Krishna Chaitanya Chundru wrote:
>> If the driver wants to move to higher data rate/speed than the current data
>> rate then the controller driver may need to change certain votes so that
>> link may come up at requested data rate/speed like QCOM PCIe controllers
>> need to change their RPMh (Resource Power Manager-hardened) state. Once
>> link retraining is done controller drivers needs to adjust their votes
>> based on the final data rate.
>>
>> Some controllers also may need to update their bandwidth voting like
>> ICC BW votings etc.
>>
>> So, add pre_link_speed_change() & post_link_speed_change() op to call
>> before & after the link re-train. There is no explicit locking mechanisms
>> as these are called by a single client Endpoint driver.
>>
>> In case of PCIe switch, if there is a request to change target speed for a
>> downstream port then no need to call these function ops as these are
>> outside the scope of the controller drivers.
> 
>> +++ b/include/linux/pci.h
>> @@ -599,6 +599,24 @@ struct pci_host_bridge {
>>   	void (*release_fn)(struct pci_host_bridge *);
>>   	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>>   	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>> +	/*
>> +	 * Callback to the host bridge drivers to update ICC BW votes, clock
>> +	 * frequencies etc.. for the link re-train to come up in targeted speed.
>> +	 * These are intended to be called by devices directly attached to the
>> +	 * Root Port. These are called by a single client Endpoint driver, so
>> +	 * there is no need for explicit locking mechanisms.
>> +	 */
>> +	int (*pre_link_speed_change)(struct pci_host_bridge *bridge,
>> +				     struct pci_dev *dev, int speed);
>> +	/*
>> +	 * Callback to the host bridge drivers to adjust ICC BW votes, clock
>> +	 * frequencies etc.. to the updated speed after link re-train. These
>> +	 * are intended to be called by devices directly attached to the
>> +	 * Root Port. These are called by a single client Endpoint driver,
>> +	 * so there is no need for explicit locking mechanisms.
> 
> No need to repeat the entire comment.  s/.././
> 
> These pointers feel awfully specific for being in struct
> pci_host_bridge, since we only need them for a questionable QCOM
> controller.  I think this needs to be pushed down into qcom somehow as
> some kind of quirk.
> 
Currently these are needed by QCOM controllers, but it may also needed
by other controllers may also need these for updating ICC votes, any
system level votes, clock frequencies etc.
QCOM controllers is also doing one extra step in these functions to
disable and enable ASPM only as it cannot link speed change support
with ASPM enabled.

- Krishna Chaitanya.
>> +	 */
>> +	void (*post_link_speed_change)(struct pci_host_bridge *bridge,
>> +				       struct pci_dev *dev, int speed);

