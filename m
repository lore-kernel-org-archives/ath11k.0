Return-Path: <ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C76C433FE
	for <ath11k@archiver.kernel.org>; Fri, 11 Nov 2022 11:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JmG2GE94Uv9MsAElLZ5QWhBgKhXfqiRBoghkKyxlB5Q=; b=qPZk7annDW4Ygz
	xUu4ZhRjcSR6i/yoBF0aUjpEAD+yLNnLPmagpKxcO7ktcZKxsKpCbR3uU5fbcYw9IFK/wxhqvQBvY
	UNnNxWqbDy/sguUmIm8tXdwJbc12P47I3h2IexBNh9AaxeLimPPWkYNbS/ArOuxesk4Spg2xcFgfw
	BRbbmdlufVFTdNPilnJnclZbne0yzto80AHBiqlh53w8Pkrt1TJ0F6fSMNVmaXVKL8wYTxfhQfka0
	r64osz2JMvdScqDfGsGcB5rfoYeiV4t/ru7yBmCKWKz5hMVAwiSbrdf4dhLwF3iWN0Z8nDikGWLgt
	TEwywqkGsnEsYSknh3Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSMB-00FK7q-NZ; Fri, 11 Nov 2022 11:37:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otSM7-00FK3A-ON
	for ath11k@lists.infradead.org; Fri, 11 Nov 2022 11:37:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ABAt9tV023290;
	Fri, 11 Nov 2022 11:37:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=cEpjjc/lvZUdP9CiszCyq3MM6Y/+aEP2AO6k/8Du84c=;
 b=GimkxAkueN0AxWa5ZAIf7M3cQ6hvKIFrjpw0AtkC3I62OCYDX/W0d3FebflIrSCI00Wg
 NSySeduJgkOMTtxCCJJNALBFGrPhln4XKVtfA4IADyjpfxbP9dUIJxmteM7C6M3apj5d
 wjrw/qRensvHScn5kp9UJVZ+/o8IUzJGyii451DKJQWgSbiZFmiQr/mi4Yuhy5zSy0+D
 xhSAJCnVmVrgzC+EYHE4NNyuVHq26HmCoPoJR2TZ/Pu8a/EED2+aJCpHUmtmR389Lh+c
 AqGUmlmmu7+bXehvsh1EOTP5XqwefvDvKB76enjCQKEjG0cfeRk4x0lAFUzSxetJ/Ngn UA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3kshkj0pd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 11:37:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2ABBblOW022575
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Nov 2022 11:37:47 GMT
Received: from [10.216.1.108] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 11 Nov
 2022 03:37:44 -0800
Message-ID: <95f9b87a-3de8-7703-2472-2327acc789b4@quicinc.com>
Date: Fri, 11 Nov 2022 17:07:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v2] wifi: ath10k: Add WLAN firmware image version info
 into smem
Content-Language: en-US
To: Stephen Boyd <swboyd@chromium.org>, <ath11k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_mpubbise@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        "kernel test
 robot" <lkp@intel.com>
References: <20221104082828.14386-1-quic_youghand@quicinc.com>
 <CAE-0n5260hssngqWE6j4A_YK0Rq_OSnscpkyVTTiPEMEDz6AGg@mail.gmail.com>
From: "Youghandhar Chintala (Temp)" <quic_youghand@quicinc.com>
In-Reply-To: <CAE-0n5260hssngqWE6j4A_YK0Rq_OSnscpkyVTTiPEMEDz6AGg@mail.gmail.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: os3zDyeKeVarzYV3ZDj7MRZOIGHxcMQl
X-Proofpoint-GUID: os3zDyeKeVarzYV3ZDj7MRZOIGHxcMQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-11_06,2022-11-11_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_033755_962625_36C553AC 
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath11k" <ath11k-bounces@lists.infradead.org>
Errors-To: ath11k-bounces+ath11k=archiver.kernel.org@lists.infradead.org


On 11/7/2022 11:05 PM, Stephen Boyd wrote:
> Quoting Youghandhar Chintala (2022-11-04 01:28:28)
>> In a SoC based solution, it would be useful to know the versions of the
>> various binary firmware blobs the system is running on. On a QCOM based
>> SoC, this info can be obtained from socinfo debugfs infrastructure. For
>> this to work, respective subsystem drivers have to export the firmware
>> version information to an SMEM based version information table.
>>
>> Having firmware version information at one place will help quickly
>> figure out the firmware versions of various subsystems on the device
>> instead of going through builds/logs in an event of a system crash.
>>
>> Fill WLAN firmware version information in SMEM version table to be
>> printed as part of socinfo debugfs infrastructure on a Qualcomm based
>> SoC.
>>
>> This change is applicable only for WCN399X targets.
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
>>
>> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> The trailers go together, no blank lines between them.
>
>> ---
>> Changes from v1:
>>   - Changed print format specifier to %zu from %i
>>   - Changed ath10k_qmi_add_wlan_ver_smem() API argument
>>            to const char *fw_build_id from char *fw_build_id
>>   - Changed version_string_size with MACRO
>> ---
>>   drivers/net/wireless/ath/ath10k/qmi.c | 28 +++++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>
>> diff --git a/drivers/net/wireless/ath/ath10k/qmi.c b/drivers/net/wireless/ath/ath10k/qmi.c
>> index 66cb7a1e628a..928d78f6d494 100644
>> --- a/drivers/net/wireless/ath/ath10k/qmi.c
>> +++ b/drivers/net/wireless/ath/ath10k/qmi.c
>> @@ -14,6 +14,7 @@
>>   #include <linux/net.h>
>>   #include <linux/platform_device.h>
>>   #include <linux/qcom_scm.h>
>> +#include <linux/soc/qcom/smem.h>
>>   #include <linux/string.h>
>>   #include <net/sock.h>
>>
>> @@ -22,6 +23,8 @@
>>
>>   #define ATH10K_QMI_CLIENT_ID           0x4b4e454c
>>   #define ATH10K_QMI_TIMEOUT             30
>> +#define ATH10K_SMEM_IMAGE_VERSION_TABLE       469
>> +#define ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX     13
>>
>>   static int ath10k_qmi_map_msa_permission(struct ath10k_qmi *qmi,
>>                                           struct ath10k_msa_mem_info *mem_info)
>> @@ -536,6 +539,29 @@ int ath10k_qmi_wlan_disable(struct ath10k *ar)
>>          return ath10k_qmi_mode_send_sync_msg(ar, QMI_WLFW_OFF_V01);
>>   }
>>
>> +static void ath10k_qmi_add_wlan_ver_smem(struct ath10k *ar, const char *fw_build_id)
>> +{
>> +       u8 *smem_table_ptr;
>> +       size_t smem_block_size;
>> +       const u32 version_string_size = MAX_BUILD_ID_LEN;
> Why not make this size_t as well so the type is the same for the
> comparison with smem_block_size?
>
>> +       const u32 smem_img_idx_wlan = ATH10K_SMEM_IMAGE_TABLE_CNSS_INDEX * 128;
>> +
>> +       smem_table_ptr = qcom_smem_get(QCOM_SMEM_HOST_ANY,
>> +                                      ATH10K_SMEM_IMAGE_VERSION_TABLE,
>> +                                      &smem_block_size);
>> +       if (IS_ERR(smem_table_ptr)) {
>> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem image version table not found");
> Is this missing a newline?
>
>> +               return;
>> +       }
>> +       if (smem_img_idx_wlan + version_string_size > smem_block_size) {
>> +               ath10k_dbg(ar, ATH10K_DBG_QMI, "smem block size too small: %zu",
> Same newline question.
>
>> +                          smem_block_size);
>> +               return;
>> +       }
>> +       memcpy(smem_table_ptr + smem_img_idx_wlan, fw_build_id,
> Is it a string? Does it need to be NUL terminated? Should this use some
> sort of strcpy()? Does the comparison above need to leave a space for
> the NUL terminator?
>
>> +              version_string_size);
>> +}
>> +
>>   static int ath10k_qmi_cap_send_sync_msg(struct ath10k_qmi *qmi)
>>   {
>>          struct wlfw_cap_resp_msg_v01 *resp;


Thank you Stephen.

I will address all your comments in next version of patch.

Regards,

Youghandhar


-- 
ath11k mailing list
ath11k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath11k
