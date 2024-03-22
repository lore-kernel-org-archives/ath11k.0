Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E192C47DD9
	for <ath11k@archiver.kernel.org>; Fri, 22 Mar 2024 02:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyNfZfB9tx4ZZFyJsl1JO4dpsnj0e/paAcTjDX/w/us=; b=uCxcqY0OwXFwTBKFOxsVkLQFWq
	sgsao7qHiB43CDYjsSaHnRG4on7qFmfWz+pnlZ12UrxvfBaxhi5eEFxBVIJWKtmcOKIyTBYi75Iqz
	+btvtFDkQsa2PGfTXpa1OwIbS/omlTFRW2FifTVkMy6Y/x2NEGXPLSw7odvfmhejTBlwBr2aX0xuG
	C61SuCMtj4fkO21gKAdJ4z3pGnz0RPdn0TWrWW3JZMydYLBybdPMJCDmDs2LiwH3V4zcGvqcLXeHN
	7y1TzjqXjZFJRBTHtMDeDsg31xmfGVHvThHEvzuxOk+nYcquci0tSsYGiepJee5TQxRJrvtoWobW5
	P3Cv3yBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnUTj-00000005Vhg-2PiS;
	Fri, 22 Mar 2024 02:17:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnUTg-00000005Ve2-1oA0
	for ath11k@lists.infradead.org;
	Fri, 22 Mar 2024 02:17:54 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42M1AsQQ006067;
	Fri, 22 Mar 2024 02:17:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=gyNfZfB9tx4ZZFyJsl1JO4dpsnj0e/paAcTjDX/w/us=; b=OS
	HsTN1xgIoKZdw2tNbsJvFUKygiu7aVYEOIExFGxkhBp2ueo5pI5dMTw38A3aUqag
	162IMl4fkfwdfh+1Gw1fnurs39+iebWEgB/1eCAtCytWfVPRd3N9wa18TiIuuQ7S
	GXQMC/L61YQRDuWk0kpaUcMI/bQv5XH6MEuEa3R0oYQj94+6wgdbZjZGpu9s9LbK
	rphfRYlO3Zo4iiQKcQJOzeA4pVb4iW67/GoXzEeTj/7tYqVEs7XEokL4RXiLLXb0
	bJBWkRUTiGG+KXCdUo806ztkfPa1MeU6xlF3iuN+M9+mk93nTaNJ+0effyt4PhBJ
	jFIOSBv4znp7xn7WVyrg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x0wy9rcpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 02:17:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42M2HWNJ020002
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Mar 2024 02:17:32 GMT
Received: from [10.231.195.68] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 21 Mar
 2024 19:17:27 -0700
Message-ID: <ea6d9f98-d4f6-452a-bb49-893de7a53ff0@quicinc.com>
Date: Fri, 22 Mar 2024 10:17:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath11k: workaround to use VMs
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
        Jose Ignacio Tornos Martinez
	<jtornosm@redhat.com>,
        <kvalo@kernel.org>, <jjohnson@kernel.org>,
        <linux-wireless@vger.kernel.org>, <ath11k@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        "kernel@quicinc.com" <kernel@quicinc.com>
References: <20240321172402.346191-1-jtornosm@redhat.com>
 <d32f59cd-653c-4bd8-90b7-f6907da6d158@quicinc.com>
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <d32f59cd-653c-4bd8-90b7-f6907da6d158@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1vMN0i_wMLC1wzG1AkdyfzHVu4v6MM8Q
X-Proofpoint-GUID: 1vMN0i_wMLC1wzG1AkdyfzHVu4v6MM8Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-21_14,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0
 malwarescore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_191752_624529_DEFC03E1 
X-CRM114-Status: GOOD (  25.10  )
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



On 3/22/2024 4:13 AM, Jeff Johnson wrote:
> On 3/21/2024 10:23 AM, Jose Ignacio Tornos Martinez wrote:
>> Currently, this driver is not working when the device is handled in a
>> Virtual Machine (PCI pass-through), as it was already reported here:
>> https://lore.kernel.org/all/fc6bd06f-d52b-4dee-ab1b-4bb845cc0b95@quicinc.com/T/
>> Baochen Qiang focused the problem and described how to have it working
>> for a specific real MSI vector from host that needs to be used in VM too.
>> And this value, as it was commented, can change.
>>
>> The problem seems complex to me and I don't know if there is any easy way
>> to solve it. Meanwhile and using the information from Baochen Qiang,
>> since the use of VMs is very interesting for testing procedures,
>> I would like to just add this workaround that consists on adding a
>> parameter to pass the real MSI vector from host to the VM. In that way,
>> checking the 'lscpi' command output from host, it could be handled manually
>> or with some user tool in order to have the VM with the driver working.
>> Of course, if this parameter is not configured (zero value and default),
>> we will have the same behavior as always.
>>
>> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/pci.c | 20 ++++++++++++++++++++
>>   1 file changed, 20 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
>> index be9d2c69cc41..0e322956b10f 100644
>> --- a/drivers/net/wireless/ath/ath11k/pci.c
>> +++ b/drivers/net/wireless/ath/ath11k/pci.c
>> @@ -31,6 +31,11 @@
>>   
>>   #define TCSR_SOC_HW_SUB_VER	0x1910010
>>   
>> +static ulong ath11k_host_msi_addr = 0;
>> +module_param_named(host_msi_addr, ath11k_host_msi_addr, ulong, 0644);
>> +MODULE_PARM_DESC(host_msi_addr,
>> +		 "Workaround to configure the MSI address that is used from host in order to be used in VM");
>> +
>>   static const struct pci_device_id ath11k_pci_id_table[] = {
>>   	{ PCI_VDEVICE(QCOM, QCA6390_DEVICE_ID) },
>>   	{ PCI_VDEVICE(QCOM, WCN6855_DEVICE_ID) },
>> @@ -443,6 +448,18 @@ static int ath11k_pci_alloc_msi(struct ath11k_pci *ab_pci)
>>   
>>   	ath11k_pci_msi_disable(ab_pci);
>>   
>> +	if (ath11k_host_msi_addr) {
>> +		ab_pci->ab->pci.msi.ep_base_data = 0;
>> +		ab->pci.msi.addr_hi = (u32)(ath11k_host_msi_addr >> 32);
>> +		ab->pci.msi.addr_lo = (u32)(ath11k_host_msi_addr & 0xffffffff);
>> +
>> +		ath11k_dbg(ab, ATH11K_DBG_PCI, "msi addr hi 0x%x lo 0x%x base data is %d\n",
>> +			   ab->pci.msi.addr_hi,
>> +			   ab->pci.msi.addr_lo,
>> +			   ab->pci.msi.ep_base_data);
>> +		return 0;
>> +	}
>> +
>>   	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
>>   	if (!msi_desc) {
>>   		ath11k_err(ab, "msi_desc is NULL!\n");
>> @@ -482,6 +499,9 @@ static int ath11k_pci_config_msi_data(struct ath11k_pci *ab_pci)
>>   {
>>   	struct msi_desc *msi_desc;
>>   
>> +	if (ath11k_host_msi_addr)
>> +		return 0;
>> +
>>   	msi_desc = irq_get_msi_desc(ab_pci->pdev->irq);
>>   	if (!msi_desc) {
>>   		ath11k_err(ab_pci->ab, "msi_desc is NULL!\n");
> 
> + kernel@quicinc.com to make sure the Qualcomm VM experts are aware of this
> issue and to see if they have any additional suggestions.
> 
If limit the fix/WAR to be within ath11k, not touching vfio or any other 
related module, I was imagining that if hardware could map the standard 
MSI registers in config space to some private MMIO registers so VM 
ath11k could read, or that if firmware could read them and send to VM 
ath11k via QMI interface? don't know if it is feasible to hardware/firmware.
> 

