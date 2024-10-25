Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91769D116E0
	for <ath11k@archiver.kernel.org>; Fri, 25 Oct 2024 02:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrH8i8krQX+X1bfQxJ+5HWA5Ak+mxQl4+BbXyfftuC0=; b=RA0OVjwFljonhTWW41YBgsZuR6
	EFwpyBKSW/u09YoakPaa35M8AUmA1q+NarQiROS6uEDrrFM3jB5CC7t6WnFpHrj+26nvKwXJf8YET
	koyvzox6pvMyrBDIiJ4H+0872NimrVvQQElRKq2Afctu7zV7D8F59uCmuuy/QjhsvVtGVW7k8DjG2
	13lDSY/OXJe9LLkPCsqnJA0b1o4IoqCSFcYqqePfVwMTJ1Ml+lE+L3fx02E9wL4KBkZGvdo6tOLmx
	Gac8a7V/RB863td0Xba1U1wkmp8iOeZRbvwyMXHfK9tBimifEnPBPofv2tOuGYKM6himrurZW3qLw
	C9QP67Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AUs-00000002KHa-46II;
	Fri, 25 Oct 2024 02:56:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4AUp-00000002KHD-0LWp
	for ath11k@lists.infradead.org;
	Fri, 25 Oct 2024 02:56:17 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OKjNIj018287;
	Fri, 25 Oct 2024 02:56:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rrH8i8krQX+X1bfQxJ+5HWA5Ak+mxQl4+BbXyfftuC0=; b=M4F10/175BxJg82R
	dq+P4GCV0qvHuiZi9jXAz6523mzAt472I11yz/csRjOBknDnJsPGFool6qphFFkU
	6oQZH3CPcYO8kz+wcmda4Hk85CDDKhN+scms1VypCKvHH+s5zX7318UUEAX/S4ES
	F4yzsY4sdzrOimGFfpSasYeXZtl6T7S+DG8N6EKbGPkrjUKOFwcjWRFBIhXLho6U
	hUWMPd6QeAV9hhxOKNfoXaIx/BmQQl0xjuTzkkwZINfl4+g9yTuFT6ttU1dFgQcG
	WsS+7WE9lj5Kq/o0FcJY7szgyHslpvLw1TBGcs3Wjhoz22C7HbLNGA2XtJE5KAD1
	6jGd5A==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3wfhfh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 02:56:08 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49P2u6kn010138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Oct 2024 02:56:06 GMT
Received: from [10.231.216.207] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 24 Oct
 2024 19:56:05 -0700
Message-ID: <bc3c06eb-1cb2-4cbb-aaad-95c09223f0cc@quicinc.com>
Date: Fri, 25 Oct 2024 10:56:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath11k: support board-specific firmware
 overrides
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <kvalo@kernel.org>, <quic_jjohnson@quicinc.com>,
        <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
References: <20241024002514.92290-1-quic_miaoqing@quicinc.com>
 <20241024002514.92290-3-quic_miaoqing@quicinc.com>
 <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
Content-Language: en-US
From: Miaoqing Pan <quic_miaoqing@quicinc.com>
In-Reply-To: <pdjhyrjoreiykv2tquvufjw3rkti5sxrjvpmkjhvkfasq7zbo4@xxntxdmhhyg5>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: u9IowL7hR9eMDbwM72mpVeR3QhH9MLQF
X-Proofpoint-ORIG-GUID: u9IowL7hR9eMDbwM72mpVeR3QhH9MLQF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 suspectscore=0 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_195615_312344_83717B0D 
X-CRM114-Status: GOOD (  31.83  )
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



On 10/25/2024 3:39 AM, Dmitry Baryshkov wrote:
> On Thu, Oct 24, 2024 at 08:25:14AM +0800, Miaoqing Pan wrote:
>> QCA6698AQ IP core is the same as WCN6855 hw2.1, but it has different RF,
>> IPA, thermal, RAM size and etc, so new firmware files used. This change
>> allows board DT files to override the subdir of the firmware directory
>> used to lookup the amss.bin and m3.bin.
> 
> I have slight concerns regarding the _board_ DT files overriding the
> subdir. This opens a can of worms, allowing per-board firmware sets,
> which (as far as I understand) is far from being what driver maintainers
> would like to see. This was required for ath10k-snoc devices, since
> firmware for those platforms is signed by the vendor keys and it is
> limited to a particular SoC or SoC family. For ath11k-pci there is no
> such limitation.
> 
> Would it be possible to use PCI subvendor / subdev to identify affected
> cards? PCI Revision? Any other way to identify the device?  Please
> provide lspci -nnvv for the affected device kind. Is there a way to
> identify the RF part somehow?

It's rather difficult, for WCN685x, there are multiple evolved subseries 
for customized products. e.g.

QCA6698AQ/hw2.1
QCA2066/hw2.1
WCN6855/hw2.0/hw2.1
WCN6856/hw2.1

They have the same PCIe ID (17cb:1103), the commit 5dc9d1a55e95 ("wifi: 
ath11k: add support for QCA2066") reads TCSR_SOC_HW_SUB_VER to enumerate 
all QCA2066 cards, it lacks of flexibility, as the list will become 
longer and longer. But it's the only choice for QCA2066, as it's 
customized for X86 platform which without DT files.

So for MSM those have DT file platforms, like SA8775P-RIDE/QCS8300-RIDE 
both attached to QCA6698AQ, we can specify the correct firmware to 
'ath11k/WCN6855/hw2.1/qca6698aq', so it's not per-board firmware, it 
depends on the type of the products(x86 windows, IoT products or AUTO).


0000:01:00.0 Network controller [0280]: Qualcomm QCNFA765 Wireless 
Network Adapter [17cb:1103] (rev 01)
	Subsystem: Qualcomm QCNFA765 Wireless Network Adapter [17cb:0108]
	Device tree node: /sys/firmware/devicetree/base/pci@1c00000/pcie@0/wifi@0


> 
> Could you possibly clarify, how this situation is handled in Windows
> world?

X86 platforms use standard m.2 PCIe card, and it will only use the 
default main firmware files, as they without DT files.

> 
>>
>> For example:
>>
>> - ath11k/WCN6855/hw2.1/amss.bin,
>>    ath11k/WCN6855/hw2.1/m3.bin: main firmware files, used by default
>>
>> - ath11k/WCN6855/hw2.1/qca6698aq/amss.bin,
>>    ath11k/WCN6855/hw2.1/qca6698aq/m3.bin
> 
> This approach looks good to me, thank you.
> 
>>
>> Tested-on: QCA6698AQ hw2.1 PCI WLAN.HSP.1.1-04402-QCAHSPSWPL_V1_V2_SILICONZ_IOE-1
>>
>> Signed-off-by: Miaoqing Pan <quic_miaoqing@quicinc.com>
>> ---
>>   drivers/net/wireless/ath/ath11k/core.c | 16 ++++++++++++++++
>>   drivers/net/wireless/ath/ath11k/core.h | 11 +++--------
>>   2 files changed, 19 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
>> index be67382c00f6..775e48551522 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.c
>> +++ b/drivers/net/wireless/ath/ath11k/core.c
>> @@ -1178,6 +1178,22 @@ static int ath11k_core_create_chip_id_board_name(struct ath11k_base *ab, char *n
>>   					       ATH11K_BDF_NAME_CHIP_ID);
>>   }
>>   
>> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
>> +				      const char *filename,
>> +				      void *buf, size_t buf_len)
>> +{	const char *board_name = NULL;
>> +
>> +	of_property_read_string(ab->dev->of_node, "firmware-name", &board_name);
> 
> soc_name rather than board_name, please. Or just fw_name.

Will update to 'fw_name'.

> 
>> +
>> +	if (board_name)
>> +		snprintf(buf, buf_len, "%s/%s/%s/%s", ATH11K_FW_DIR,
>> +			 ab->hw_params.fw.dir, board_name, filename);
>> +	else
>> +		snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
>> +			 ab->hw_params.fw.dir, filename);
>> +}
>> +EXPORT_SYMBOL(ath11k_core_create_firmware_path);
>> +
>>   const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>>   						    const char *file)
>>   {
>> diff --git a/drivers/net/wireless/ath/ath11k/core.h b/drivers/net/wireless/ath/ath11k/core.h
>> index 09c37e19a168..ce4102cfed4d 100644
>> --- a/drivers/net/wireless/ath/ath11k/core.h
>> +++ b/drivers/net/wireless/ath/ath11k/core.h
>> @@ -1249,6 +1249,9 @@ bool ath11k_core_coldboot_cal_support(struct ath11k_base *ab);
>>   
>>   const struct firmware *ath11k_core_firmware_request(struct ath11k_base *ab,
>>   						    const char *filename);
>> +void ath11k_core_create_firmware_path(struct ath11k_base *ab,
>> +				      const char *filename,
>> +				      void *buf, size_t buf_len);
>>   
>>   static inline const char *ath11k_scan_state_str(enum ath11k_scan_state state)
>>   {
>> @@ -1295,14 +1298,6 @@ static inline struct ath11k *ath11k_ab_to_ar(struct ath11k_base *ab,
>>   	return ab->pdevs[ath11k_hw_mac_id_to_pdev_id(&ab->hw_params, mac_id)].ar;
>>   }
>>   
>> -static inline void ath11k_core_create_firmware_path(struct ath11k_base *ab,
>> -						    const char *filename,
>> -						    void *buf, size_t buf_len)
>> -{
>> -	snprintf(buf, buf_len, "%s/%s/%s", ATH11K_FW_DIR,
>> -		 ab->hw_params.fw.dir, filename);
> 
> It could have perfectly lived here. Is there any reason to move the
> function?

Will update.

> 
>> -}
>> -
>>   static inline const char *ath11k_bus_str(enum ath11k_bus bus)
>>   {
>>   	switch (bus) {
>> -- 
>> 2.25.1
>>
> 


